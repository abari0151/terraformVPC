resource "aws_instance" "web1" {
    ami = "ami-038f1ca1bd58a5790"
    instance_type = "t2.micro" 
    subnet_id = aws_subnet.sub-pub-1.id
    vpc_security_group_ids = aws_security_group.public-ec2.id 
    #public ssh key
    key_name = "terra"
    user_data = file("install_http.sh")
    tags = {
        "Name" = "terra-demo"
    }
}

resource "aws_instance" "web2" {
    ami = "ami-038f1ca1bd58a5790"
    instance_type = "t2.micro" 
    subnet_id = aws_subnet.sub-pub-2.id
    vpc_security_group_ids = aws_security_group.public-ec2.id
    #public ssh key
    key_name = "terra"
    user_data = file("install_http.sh")
    tags = {
        "Name" = "terra-demo"
    }
}

resource "aws_instance" "database" {
    ami = "ami-038f1ca1bd58a5790"
    instance_type = "t2.micro" 
    subnet_id = aws_subnet.sub-priv-1.id
    vpc_security_group_ids = aws_security_group.private-ec2.id
    #public ssh key
    key_name = "terra"
    tags = {
        "Name" = "terra-demo"
    }
}

}