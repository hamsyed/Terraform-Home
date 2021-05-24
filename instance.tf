resource "aws_instance" "appache_web" {
  count = 2
  ami=  "${lookup(var.image, var.region)}"
  instance_type = "${var.instance_type}"
  subnet_id = "${aws_subnet.public.*.id[count.index]}"
  tags = {

Name = "${var.tags["Name"]}"

  }

}
