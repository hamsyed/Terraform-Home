resource "aws_launch_configuration" "apache-webserver" {
  name = "webserver"
  image_id      = "ami-0d5eff06f840b45e9"
  instance_type = "${var.instance_type}"
  associate_public_ip_address = "true"
  key_name = "terraform.pem" 
  user_data = "${file("bash.sh")}"

  provisioner "local-exec" {
    command = "/bin/bash bash.sh"

  environment = {
    Name = "${var.tags["Name"]}"
    }
  }

  provisioner "file" {
  source      = ". bash.sh"
  destination = "/home/ec2-user"

  connection {
    type     = "ssh"
    user     = "ec2-user"
    host     = "self.public_ip"
    private_key = file(("./terraform.pem"))
  }
    
  provisioner "remote-exec" {
    inline = [
      "sudo cd /home/ec2-user",
      "sudo ./bash.sh",
       ]
}  

  lifecycle {
    create_before_destroy = true
  }
}
