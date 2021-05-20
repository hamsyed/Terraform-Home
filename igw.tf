resource "aws_internet_gateway" "Hgw" {
  vpc_id = "${aws_vpc.Hmain.id}"

  tags = {
    Name = "JavahomeIGW"
  }
}
