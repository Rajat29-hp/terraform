# attach the volume to instance
resource "aws_volume_attachment" "ebs-vol-attach" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.ebs-vol.id}"
  instance_id = "${aws_instance.test-server.id}"
}

# create ec2 instance 
resource "aws_instance" "test-server" {
  ami               = "ami-21f78e11"
  availability_zone = "us-west-2a"
  instance_type     = "t1.micro"
  ey_name        = "terraform-key"
  security_groups = ["new-securitygroup-for-terraform"]
  
  tags = {
    Name = "HelloWorld"
  }
}

# create block storage
resource "aws_ebs_volume" "ebs-vol" {
  availability_zone = "us-west-2a"
  size              = 2
  tags = {
    Name = "volume-attach"
  }
}
