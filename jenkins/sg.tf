################# Security Groups ####################

resource "aws_security_group" "jenkins_master" {
  name        = "Jenkins_master"
  description = "Security group for Jenkins master"
  vpc_id      = "${data.aws_vpc.current.id}"

  tags {
    Name = "Jenkins_master"
  }
}

resource "aws_security_group" "jenkins_slaves" {
  name        = "Jenkins_slaves"
  description = "Security group for Jenkins slaves"
  vpc_id      = "${data.aws_vpc.current.id}"

  tags {
    Name = "Jenkins_slaves"
  }
}

################# Security group rules ####################

#### Jenkins master
## Ingress rules
resource "aws_security_group_rule" "ingress_for_jenkins_master" {
  count             = "${length(var.master_ingress_rules)}"
  type              = "ingress"
  from_port         = "${element(var.master_ingress_rules[count.index], 0)}"
  to_port           = "${element(var.master_ingress_rules[count.index], 1)}"
  protocol          = "${element(var.master_ingress_rules[count.index], 2)}"
  cidr_blocks       = "${element(var.master_ingress_rules[count.index], 3)}"
  description       = "${element(var.master_ingress_rules[count.index], 4)}"
  security_group_id = "${aws_security_group.jenkins_master.id}"
}

## Egress rules
resource "aws_security_group_rule" "egress_for_jenkins_master" {
  count             = "${length(var.master_egress_rules)}"
  type              = "egress"
  from_port         = "${element(var.master_egress_rules[count.idex], 0)}"
  to_port           = "${element(var.master_egress_rules[count.idex], 1)}"
  protocol          = "${element(var.master_egress_rules[count.idex], 2)}"
  cidr_blocks       = "${element(var.master_egress_rules[count.idex], 3)}"
  description       = "${element(var.master_egress_rules[count.idex], 4)}"
  security_group_id = "${aws_security_group.jenkins_master.id}"
}

#### Jenkins slave
## Ingress rules
resource "aws_security_group_rule" "ingress_for_jenkins_slave" {
  count             = "${length(var.slave_ingress_rules)}"
  type              = "ingress"
  from_port         = "${element(var.slave_ingress_rules[count.index], 0)}"
  to_port           = "${element(var.slave_ingress_rules[count.index], 1)}"
  protocol          = "${element(var.slave_ingress_rules[count.index], 2)}"
  cidr_blocks       = "${element(var.slave_ingress_rules[count.index], 3)}"
  description       = "${element(var.slave_ingress_rules[count.index], 4)}"
  security_group_id = "${aws_security_group.jenkins_slaves.id}"
}

## Egress rules
resource "aws_security_group_rule" "egress_for_jenkins_slave" {
  count             = "${length(var.slave_egress_rules)}"
  type              = "egress"
  from_port         = "${element(var.slave_egress_rules[count.idex], 0)}"
  to_port           = "${element(var.slave_egress_rules[count.idex], 1)}"
  protocol          = "${element(var.slave_egress_rules[count.idex], 2)}"
  cidr_blocks       = "${element(var.slave_egress_rules[count.idex], 3)}"
  description       = "${element(var.slave_egress_rules[count.idex], 4)}"
  security_group_id = "${aws_security_group.jenkins_slaves.id}"
}
