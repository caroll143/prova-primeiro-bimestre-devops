require("dotenv").config();

const express = require("express");
const pool = require("./db");

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

app.get("/health", async (req, res) => {
  try {
    await pool.query("SELECT 1");
    res.json({
      status: "ok",
      database: "connected"
    });
  } catch (error) {
    res.status(500).json({
      status: "error",
      database: "disconnected"
    });
  }
});

app.post("/reservas", async (req, res) => {
  try {
    const { cliente, data, status } = req.body;

    if (!cliente || !data || !status) {
      return res.status(400).json({
        error: "cliente, data e status são obrigatórios"
      });
    }

const result = await pool.query(
  "INSERT INTO reservas (cliente, data, status) VALUES ($1, $2, $3) RETURNING *",
  [cliente, data, status]
);

    res.status(201).json(result.rows[0]);
  } catch (error) {
    console.error(error);
    res.status(500).json({
      error: "Erro ao criar reserva"
    });
  }
});

app.get("/reservas", async (req, res) => {
  try {
    const result = await pool.query(
      "SELECT * FROM reservas ORDER BY id"
    );

    res.json(result.rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({
      error: "Erro ao buscar reservas"
    });
  }
});

app.get("/reservas/:id", async (req, res) => {
  try {
   const result = await pool.query(
  "SELECT * FROM reservas WHERE id = $1",
  [req.params.id]
);

    if (result.rows.length === 0) {
      return res.status(404).json({
        error: "Reserva não encontrada"
      });
    }

    res.json(result.rows[0]);
  } catch (error) {
    console.error(error);
    res.status(500).json({
      error: "Erro ao buscar reserva"
    });
  }
});

app.put("/reservas/:id", async (req, res) => {
  try {
    const { cliente, data, status } = req.body;

    if (!cliente || !data || !status) {
      return res.status(400).json({
        error: "cliente, data e status são obrigatórios"
      });
    }

   const result = await pool.query(
  "UPDATE reservas SET cliente = $1, data = $2, status = $3 WHERE id = $4 RETURNING *",
  [cliente, data, status, req.params.id]
);

    if (result.rows.length === 0) {
      return res.status(404).json({
        error: "Reserva não encontrada"
      });
    }

    res.json(result.rows[0]);
  } catch (error) {
    console.error(error);
    res.status(500).json({
      error: "Erro ao atualizar reserva"
    });
  }
});

app.delete("/reservas/:id", async (req, res) => {
  try {
   const result = await pool.query(
  "DELETE FROM reservas WHERE id = $1 RETURNING *",
  [req.params.id]
);

    if (result.rows.length === 0) {
      return res.status(404).json({
        error: "Reserva não encontrada"
      });
    }

    res.json({
      message: "Reserva excluída com sucesso",
      reserva: result.rows[0]
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({
      error: "Erro ao excluir reserva"
    });
  }
});

app.listen(PORT, () => {
  console.log(`API rodando na porta ${PORT}`);
});
