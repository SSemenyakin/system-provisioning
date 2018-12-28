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


## Egress rules

#### Jenkins slave


## Ingress rules


## Egress rules