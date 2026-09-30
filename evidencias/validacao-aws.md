# Validacao da implantacao AWS

## Infraestrutura

A infraestrutura foi provisionada utilizando Terraform na regiao us-east-1.

Recursos utilizados:

- VPC 10.0.0.0/16
- 2 sub-redes publicas
- 2 sub-redes privadas
- Internet Gateway
- Route Tables
- Security Groups
- EC2 t2.micro
- RDS PostgreSQL db.t3.micro
- S3 para Terraform State
- DynamoDB para locking do Terraform State

## Terraform

A configuracao foi organizada em modulos:

- modules/vpc
- modules/security-group
- modules/ec2
- modules/rds

Comandos executados:

terraform fmt -recursive
terraform validate
terraform plan
terraform apply

O terraform validate retornou:

Success! The configuration is valid.

## API na EC2

A API foi executada em um container Docker na EC2.

Teste realizado:

curl http://localhost:3000/health

Resultado:

{"status":"ok","database":"connected"}

## Banco de dados

Foi utilizado Amazon RDS PostgreSQL com conexao SSL.

A tabela reservas foi criada e utilizada pela aplicacao.

## Teste do CRUD

Foram realizados:

- POST /reservas
- GET /reservas
- PUT /reservas/:id
- DELETE /reservas/:id

Apos a exclusao, o GET /reservas retornou:

[]

## Resultado

A implantacao AWS foi validada com sucesso, incluindo:

- API Node.js/Express
- Docker
- EC2
- RDS PostgreSQL
- conexao SSL
- operacoes de CRUD
- Terraform
- S3
- DynamoDB