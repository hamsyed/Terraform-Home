resource "aws_launch_configuration" "apache-webserver" {
  name = "webserver"
  image_id      = "ami-0d5eff06f840b45e9"
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  user_data = "${file("bash.sh")}"

  lifecycle {
    create_before_destroy = true
  }
}
