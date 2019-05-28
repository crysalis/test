provider "aws" {
  alias  = "main"
  region = "${var.region}"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "1.66.0"
  name   = "test-vpc"

  azs    = [ "eu-central-1a", "eu-central-1b"]
  cidr   = "${var.cidr}"
  private_subnets = "${var.private_subnets}"
  public_subnets  = "${var.public_subnets}"
  enable_nat_gateway = true
}

data "aws_subnet_ids" "all" {
  vpc_id = "${module.vpc.vpc_id}"
}
