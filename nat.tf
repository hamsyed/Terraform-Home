resource "aws_nat_gateway" "hngw" {
  allocation_id = "eipalloc-03aca8ecf12847f24"
  subnet_id     = "${aws_subnet.public.*.id[0]}"

  tags = {
    Name = "gw NAT"
  }
}

resource "aws_route_table" "Prt" {
  vpc_id = "${aws_vpc.Hmain.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.hngw.id}"
  }

  tags = {
    Name = "JavaHomePriavet"
  }
}

resource "aws_route_table_association" "prt_ass" {
count = "${length(slice(local.pazs, 0, 2))}"
subnet_id      = "${aws_subnet.private.*.id[count.index]}"
route_table_id = "${aws_route_table.Prt.id}"
}
