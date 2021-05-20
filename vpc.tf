resource "aws_vpc" "Hmain" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = "true"
  instance_tenancy = "default"

  tags = {
    Name = "JavaHome"
    Env = "${terraform.workspace}"
  }

}

data "aws_availability_zones" "azs" {
  state = "available"
}
