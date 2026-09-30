# Evidências da validação local

## Docker Compose

A aplicação foi executada com:

docker compose up -d --build

## Healthcheck

Endpoint:

GET /health

Resultado esperado:

{
  "status": "ok",
  "database": "connected"
}

## CRUD de reservas

Foram testadas as operações:

- POST /reservas
- GET /reservas
- GET /reservas/:id
- PUT /reservas/:id
- DELETE /reservas/:id

A API conseguiu criar, consultar, atualizar e excluir reservas utilizando PostgreSQL.

## Persistência

A aplicação utiliza PostgreSQL em container Docker, com volume nomeado postgres_data.

## Rede

API e PostgreSQL estão conectados pela rede Docker technova-network.

## Segurança do container

A API utiliza um usuário não-root chamado appuser.

## Porta

A API está disponível localmente em:

http://localhost:3001
