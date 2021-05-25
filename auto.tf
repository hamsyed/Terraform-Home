resource "aws_autoscaling_group" "web_auto" {
  name                 = "web_scaling"
  availability_zones        = ["us-east-1a"]
  launch_configuration = "${aws_launch_configuration.apache-webserver.name}"
  min_size             = 1
  max_size             = 2

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_policy" "cpu_utilization" {
  name = "cpu_utilization"
  autoscaling_group_name = "${aws_autoscaling_group.web_auto.name}"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 40.0
  }
}
