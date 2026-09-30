# TechNova Reservations API

## Aluno

- Nome: Carollini Godoy dos Santos Roque
- RA: 3925000

## Descrição

Projeto desenvolvido para a prova do primeiro bimestre da disciplina de DevOps.

A aplicação consiste em uma API REST para gerenciamento de reservas da TechNova, utilizando Node.js, Express e PostgreSQL.

A infraestrutura será provisionada na AWS utilizando Terraform, incluindo VPC, sub-redes públicas e privadas, grupos de segurança, EC2 e RDS PostgreSQL.

O projeto também utiliza Docker e Docker Compose para execução local da aplicação e do banco de dados.

## Tecnologias

- Node.js
- Express
- PostgreSQL
- Docker
- Docker Compose
- Terraform
- AWS
- Git e GitHub

## Endpoints

- GET /health
- POST /reservas
- GET /reservas
- GET /reservas/:id
- PUT /reservas/:id
- DELETE /reservas/:id

## Execução local

Para iniciar a aplicação:

```bash
docker compose up -d --build