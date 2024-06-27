output "webserver_publicIP_address" {
    value = aws_instance.web_server.public_ip
}

output "webserver_privateIP_address" {
    value = aws_instance.web_server.private_ip
}

output "webserver_instance_status" {
    value = aws_instance.web_server.instance_state
}

output "docker_instance_status" {
    value = aws_instance.docker_server.instance_state
}


output "docker_publicIP_address" {
    value = aws_instance.docker_server.public_ip
}

output "docker_privateIP_address" {
    value = aws_instance.docker_server.private_ip
}


output "sg_id" {
    value = aws_security_group.webserver_sg.id
}

