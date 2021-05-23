locals {
  pazs = "${data.aws_availability_zones.azs.names}"

 }


resource "aws_subnet" "private" {
  count = "${length(slice(local.pazs, 0, 2))}"
  vpc_id     = "${aws_vpc.Hmain.id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr, 8, count.index + length(local.az_names))}"
  availability_zone  = "${local.pazs[count.index]}"

  tags = {
    Name = "PrivateSubnet-${count.index + 1}"
  }
}
