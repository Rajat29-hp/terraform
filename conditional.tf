resource "aws_instance""demoserver"{
instance_type = var.environment=="development" ? "t2.mirco" : "t3.medium"
 ami = "ami -324kflwd2324"
}