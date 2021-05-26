resource "aws_elb" "web-elb" {
  name               = "web-elb"
  availability_zones = ["us-east-1a"]

 
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

    health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  tags = {
    Name = "web-elb"
  }
}
