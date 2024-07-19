terraform {
  backend "s3" {
    bucket         = "talent-academy-monika-lab-tfstates"
    key            = "talent-academy/Group1_bluegreen_infrastructure/terraform.tfstates"
    dynamodb_table = "terraform-lock"
    region = "eu-west-1"
  }
}