// name = value
// data types: interger, string, boolean, list, dictionary

// image_id = "ami-08a0d1e16fc3f61ea"

variable "image_id" {
    type = string
    default = "ami-08a0d1e16fc3f61ea"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "key_pair" {
    type = string
    default = "terraform_key"
}


variable "webserver_script" {
    type = string
    default = "./scripts/webservice.sh"
}


variable "docker_script" {
    type = string
    default = "./scripts/dockerservice.sh"
}


variable "webserver_tags" {
    type = map(string)
    default = {
      "Name" = "Web Server"
      "Env"  = "Dev"
      "Owner" = "Rnstech"
    }
}


variable "dockerserver_tags" {
    type = map(string)
    default = {
      "Name" = "Docker Server"
      "Env"  = "Dev"
      "Owner" = "Rnstech"
    }
}


variable "Sg_ports" {
    type = list(number)
    default = [ 22, 80, 0 ]
}


variable "sg_cidr_block" {
    type = list(string)
    default = [ "0.0.0.0/0" ]
}


variable "sg_tags" {
    type = map(string)
    default = {
      "Name" = "Webserver Server"
      "Env"  = "Dev"
      "Owner" = "Rnstech"
    }
}
