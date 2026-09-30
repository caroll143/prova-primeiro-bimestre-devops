terraform {
  backend "s3" {
    bucket         = "technova-prova-devops-3925000"
    key            = "prova-primeiro-bimestre/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "technova-terraform-lock"
  }
}