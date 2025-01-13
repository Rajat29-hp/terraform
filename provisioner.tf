# specfic actions on the local machine or on a remote machine.
# generate the ssh key
# create file in local machine - /myfile.txt

resource "aws_instance" "linux" {
  ami             = "ami-02df5cb5ad97983ba"
  instance_type   = "t2.micro"
  key_name        = "my-key-new"
  security_groups = ["allow_tls"]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = self.public_ip
    private_key = file("/home/project/my-key")
  }

  provisioner "file" {
    source      = "/tmp/myfile.txt"
    destination = "/tmp/linuxfle.txt"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.linux.private_ip} >> /home/check_ip.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "touch helloworld.txt",
      "echo helloworld remote provisioner >> helloworld.txt",
    ]
  }

  tags = {
    name = "demo-server"
  }
}
