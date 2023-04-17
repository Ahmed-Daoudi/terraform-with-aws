resource "aws_key_pair" "dove-key"{
   key_name = "dovekey"
   public_key = file("dovekey.pub") # this function read the content of a file
}


resource "aws_instance" "instance_with_terraform" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "dovekey" # aws_key_pair.dove-key.key_name
  vpc_security_group_ids = ["sg-03be6840275d25601"]
  tags = {
    Name = "terraform_instance_with_provisioner"
  }

  #provisioner to push script to the instance
  provisioner "file" {
     source "script.sh"
     destination = "/tmp/script.sh"
  }  

  #provisioner to execute the script 
  provisioner "remote-exec" {
     inline = [
          "chmod u+x /tmp/script.sh",
          "sudo /tmp/script.sh"
     ]
  }  

  
  # tell terraform to use this variable to connect to the instance 
  connetion {
     user = var.USER
     private_key = file("dovkey")
     host = self.public_ip
  }

}