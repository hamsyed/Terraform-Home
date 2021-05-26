resource "aws_security_group" "allow_elb" {
  name= "allow_http"
  description = "Allow tcp inbound traffic"
  vpc_id      = "${aws_vpc.Hmain.id}"

  ingress {
    description      = "allow elb to ec2"
    from_port= 80
    to_port= 80
    protocol= "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port= 0
    to_port= 0
    protocol= "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "elb-sec"
  }
}
