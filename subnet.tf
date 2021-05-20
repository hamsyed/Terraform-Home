locals {
  az_names = "${data.aws_availability_zones.azs.names}"
}

resource "aws_subnet" "public" {
  count = "${length(local.az_names)}"  
  vpc_id     = "${aws_vpc.Hmain.id}"
  cidr_block = "${cidrsubnet("${var.vpc_cidr}", 8,count.index)}"
  availability_zone = "${local.az_names[count.index]}"

  tags = {
    Name = "subnet1-${count.index + 1}"
    Env = "${terraform.workspace}"
  }
}



