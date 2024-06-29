data "aws_ami" "ec2_instance" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "web_server"{
    ami           = data.aws_ami.ec2_instance.id //var.image_id  // "ami-08a0d1e16fc3f61ea"
    instance_type = var.instance_type  //"t2.micro"
    key_name = var.key_pair  //"terraform_key"
    vpc_security_group_ids = [ aws_security_group.webserver_sg.id ]
    user_data = file(var.webserver_script)   //("./scripts/webservice.sh")
    
    tags = var.webserver_tags
}

resource "aws_instance" "docker_server"{
    ami           = data.aws_ami.ec2_instance.id
    instance_type = var.instance_type
    key_name = var.key_pair
    vpc_security_group_ids = [ aws_security_group.webserver_sg.id ]
    user_data = file(var.docker_script)     //("./scripts/dockerservice.sh")
    
    tags = var.dockerserver_tags
}


resource "aws_security_group" "webserver_sg"{
    name = "webserver"
    description = "Allow SSH & HTTP Inbound traffic and all outbound traffic"
    
    //vpc_id = aws_vpc.main.id
    //ssh  - 22
    //http  - 80

    dynamic "ingress" {
      for_each = var.Sg_ports
      iterator = port
      content {
        from_port = port.value
        to_port = port.value
        protocol         = "tcp"
        cidr_blocks      = var.sg_cidr_block   //["0.0.0.0/0"]
      }
    }

    # ingress {
    #     from_port        = var.Sg_ports[0]  //22
    #     to_port          = var.Sg_ports[0]  //22
    #     protocol         = "tcp"
    #     cidr_blocks      = var.sg_cidr_block   //["0.0.0.0/0"]
    #     description = "Inbound rule for ssh protocol"
    # }

    # ingress {
    #     from_port        = var.Sg_ports[1]    //80
    #     to_port          = var.Sg_ports[1]    //80
    #     protocol         = "tcp"
    #     cidr_blocks      = var.sg_cidr_block
    #     description = "Inbound rule for http protocol"
    # }


    egress {
        from_port        = 0   //0
        to_port          = 0   //0
        protocol         = "-1"
        cidr_blocks      = var.sg_cidr_block
    }
    
    tags = var.sg_tags
}