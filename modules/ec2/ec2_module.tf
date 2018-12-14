### Variables

### Module of base EC2 instance
resource "aws_instance" "base_instance" {
  instance_type = "${var.base_instance_type}"
  ami           = "${var.base_ami}"

  tags {
    Name = "${var.base_insrance_name}"
  }

  availability_zone           = "${var.availability_zone}"
  key_name                    = "${var.key_name}"
  security_groups             = "${var.security_group}"
  subnet_id                   = "${var.subnet_id}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
}
