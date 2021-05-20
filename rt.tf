resource "aws_route_table" "Hrt" {
  vpc_id = "${aws_vpc.Hmain.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.Hgw.id}"
  }

  tags = {
    Name = "Javahome-publicRoute"
  }
}

resource "aws_route_table_association" "public_route_ass" {
  count = "${length(data.aws_availability_zones.azs.names)}"
  subnet_id      = "${aws_subnet.public.*.id[count.index]}"
  route_table_id = "${aws_route_table.Hrt.id}"
}
