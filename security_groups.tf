module "rds_sg" {
  source = "terraform-aws-modules/security-group/aws"
  version = "2.17.0"

  name        = "rds"
  description = "Security group for PostgreSQL port open within VPC"
  vpc_id      = "${module.vpc.vpc_id}"
  ingress_with_cidr_blocks = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = "${var.cidr}"
    },
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "${var.cidr}"
    },
  ]
}

module "apps_sg" {
  source = "terraform-aws-modules/security-group/aws"
  version = "2.17.0"

  name        = "apps"
  description = "Security group for App servers"
  vpc_id      = "${module.vpc.vpc_id}"
  ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "${var.cidr}"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}