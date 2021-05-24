variable "region" {  
  default = "us-east-1"  
}  
variable "vpc_cidr" {  
  default = "10.20.0.0/16"  
}  
  
variable "instance_type" {
  default = "t2.micro"
}

variable "image" {
  type = map
  default = {
    us-east-1 = "ami-00a9d4a05375b2763"
    us-east-2 = "ami-00d1f8201864cc10c"
}
}

variable "tags" {
  type = map  
  default = {  
    Name = "webserver"  
}  
}     
