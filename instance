resource "aws_instance" "appache_web" {
  count = 2
  ami=  "${lookup(var.image, var.region)}"
  instance_type = "${var.instance_type}"
  subnet_id = "${aws_subnet.public.*.id[count.index]}"
  iam_instance_profile = "${aws_iam_instance_profile.s3_profile.name}"
  vpc_security_group_ids = ["${aws_security_group.allow_http.id}"]
  tags = {

Name = "${var.tags["Name"]}"

  }
   user_data = "${file("./apache.sh")}"
}

resource "aws_iam_instance_profile" "s3_profile" {
  name = "ec2-s3_profile"
  role = "${aws_iam_role.ec2_role.name}"
}
