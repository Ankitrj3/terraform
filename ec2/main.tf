# first creation of key-pair
# generate key using ssh-keygen
resource "aws_key_pair" "key_pair" {
    key_name   = "ankit-key"
    public_key = file("ec2.pub")

}
# configure vpc
# we will use default vpc
resource "aws_default_vpc" "default" {
    tags = {
        Name = "Default VPC"
    }
}
# securityGroup
resource "aws_security_group" "sg" {
    name        = "ankit-sg"
    description = "Allow SSH and HTTP"
    vpc_id = aws_default_vpc.default.id

    tags = {
      Name = "ankit-sg"
    }

    ingress  {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow SSH"
    }
    ingress  {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow HTTP"
    }
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow HTTP"
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow all outbound traffic"
    }
}
# Now Ec2
resource "aws_instance" "ankit" {
    for_each = tomap({
        instance-ankit = "t2.micro"
        instance-ankitmedium = "t2.medium"
    })
    # count = 3 # it will create 3 instances with same name
    # one more meta-argument
    # depends_on use to check if these resources are created before the instance
    depends_on = [aws_key_pair.key_pair, aws_security_group.sg]

    ami = var.ec2_ami
    instance_type = each.value
    key_name = aws_key_pair.key_pair.key_name
    security_groups = [aws_security_group.sg.name]
    user_data = file("nginx_install.sh")
    root_block_device {
      volume_size = var.environment == "production" ? 20 : var.ec2_default_volume_size 
      volume_type = var.ec2_volume_type
    }
    tags = {
        Name = each.key
    }
}

# chmod 400 key_file
# ssh -i key_file ec2-user@public_ip

resource "aws_instance" "awsinstance" {
    ami = "unknown"
    instance_type = "unknown"
}

# terraform import aws_instance.definednameOfInstance_inTerraform instance_id
# terraform state list
# terraform state show <resource_name>
# terraform state rm <resource_name>
# terraform state mv <src> <dest>