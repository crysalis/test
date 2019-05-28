provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket   = "qoden-test-tfstate"
    key      = "state/terraform.tfstate"
    encrypt  = "true"
    region   = "eu-central-1"
  }
}

resource "aws_key_pair" "deployer" {
  provider   = "aws.main"
  key_name   = "deployer"
  public_key = "${file("./ssh/deployer_key.pub")}"
}
