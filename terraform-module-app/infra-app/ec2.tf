resource "aws_key_pair" "key_pair" {
    key_name   = "${var.environment}-key"
    public_key = file("/Users/ankitranjan/Desktop/terraform/terraform-module-app/terraform-module-app.pub")

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
    name        = "${var.environment}-sg"
    description = "Allow SSH and HTTP"
    vpc_id = aws_default_vpc.default.id

    tags = {
      Name = "${var.environment}-sg"
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
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow all outbound traffic"
    }
}
# Now Ec2
resource "aws_instance" "instance" {
    count = var.instance_count
    depends_on = [aws_key_pair.key_pair, aws_security_group.sg]

    ami = var.ami
    instance_type = var.instance_type
    key_name = aws_key_pair.key_pair.key_name
    security_groups = [aws_security_group.sg.name]
    root_block_device {
      volume_size = var.environment == "production" ? 20 : 10
      volume_type = var.volume_type
    }
    tags = {
        Name = "ankit-instance-${var.environment}-${count.index + 1}"
        environment = var.environment
    }
}