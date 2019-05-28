module "rds" {
  source                 = "terraform-aws-modules/rds/aws"
  vpc_security_group_ids = ["${module.rds_sg.this_security_group_id}"]
  subnet_ids             = ["${module.vpc.private_subnets}"]

  identifier = "postgres"

  engine              = "postgres"
  engine_version      = "11.2"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  family              = "postgres11"
  publicly_accessible = "false"

  name     = <testdb>
  username = <userdb>
  password = <Ewoomach2iemahph>
  port     = "5432"

  maintenance_window         = "Mon:06:00-Mon:07:00"
  backup_window              = "03:00-06:00"
  backup_retention_period    = "7"
  auto_minor_version_upgrade = "false"

  tags = {
    env  = "dev"
  }
}