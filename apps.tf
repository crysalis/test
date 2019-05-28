module "instance" {
  source                        = "terraform-aws-modules/ec2-instance/aws"
  version                       = "1.21.0"

  name                          = "test"
  instance_count                = 1

  ami                           = "${var.apps_ami}"
  instance_type                 = "t2.micro"
  key_name                      = "${aws_key_pair.deployer.key_name}"
  vpc_security_group_ids        = ["${module.apps_sg.this_security_group_id}"]
  subnet_id                     = "${element(data.aws_subnet_ids.all.ids, 2)}"
  associate_public_ip_address   = "true"
  

  tags = {
    env = "dev"
  }

}


# resource "aws_instance" "test" {
#   ami                    = "${var.apps_ami}"
#   instance_type          = "t2.micro"
#   subnet_id              = "${element(data.aws_subnet_ids.all.ids, 2)}"
#   vpc_security_group_ids = ["${module.apps_sg.this_security_group_id}"]
#   key_name               = "${aws_key_pair.deployer.key_name}"


#   provisioner "local-exec" {
#     command = "ansible-playbook bootstrap.yml  -s -i \"${aws_instance.test.public_ip}\" --private-key ssh/deployer_key"
#   }

#   tags = {
#     env  = "dev"
#   }
# }



