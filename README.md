# TechNova Reservations API

## Aluno

- Nome: Carollini Godoy dos Santos Roque
- RA: 3925000

## Descrição

Projeto desenvolvido para a prova do primeiro bimestre da disciplina de DevOps.

A aplicação consiste em uma API REST para gerenciamento de reservas da TechNova, utilizando Node.js, Express e PostgreSQL.

A aplicação pode ser executada localmente utilizando Docker e Docker Compose e foi implantada na AWS utilizando Terraform, EC2 e RDS PostgreSQL.

## Tecnologias

- Node.js
- Express
- PostgreSQL
- Docker
- Docker Compose
- Terraform
- AWS
- Git e GitHub

## Arquitetura AWS

A infraestrutura foi provisionada utilizando Terraform na região us-east-1.

Recursos principais:

- VPC 10.0.0.0/16
- 2 sub-redes públicas
- 2 sub-redes privadas
- Internet Gateway
- Route Tables
- Security Groups
- EC2 t2.micro
- RDS PostgreSQL db.t3.micro
- S3 para Terraform State
- DynamoDB para locking do Terraform State

A infraestrutura Terraform está organizada em módulos:

- modules/vpc
- modules/security-group
- modules/ec2
- modules/rds

A API é executada em um container Docker na EC2 e se conecta ao PostgreSQL no RDS utilizando conexão SSL.

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