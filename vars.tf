variable "region" {
  "default" = "eu-central-1"
}

variable "cidr" {
  "default" = "10.10.16.0/20"
}

variable "private_subnets" {
  "default" = [
  	"10.10.17.0/24",
  	"10.10.18.0/24"
  ]
}

variable "public_subnets" {
  "default" = [
  	"10.10.19.0/24",
  	"10.10.20.0/24"
  ]
}

variable "apps_ami" {
  "default" = "ami-01fb3b7bab31acac5"
}
