########### Jenkins master instance ###############
module "Jenkins_master" {
  source                      = "../modules/ec2/"
  base_instance_type          = "${var.master_instance_type}"
  base_ami                    = ""
  base_instance_name          = "${var.master_instance_name}"
  availability_zone           = "${element(var.AZ, 0)}"
  key_name                    = "${var.key_name}"
  security_group              = "${aws_security_group.jenkins_master}"
  subnet_id                   = "${data.aws_subnet.public_subnet.id}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  iam_instance_profile        = "${aws_iam_instance_profile.jenkins}"
}
