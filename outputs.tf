output "apps" {
  value = "${module.instance.public_ip}"
}

output "postgresql" {
  value = "${module.rds.this_db_instance_address}"
}

