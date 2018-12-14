################# AWS provider ####################

provider "aws" {
  version                 = "1.43.2"
  shared_credentials_file = "/home/sergey/.aws/credentials"
  profile                 = "default"
  region                  = "us-east-1"
}

################# Terrafrom Version ###############

terraform {
  version = "0.11.10"

  backend "s3" {
    bucket = "my-aws-infra"
    key    = "jenkins/jenkins.tfstate"
    region = "us-east-1"
  }
}

################ Data Source ######################

data "aws_vpc" "current" {
  filter {
    name   = "tag:Name"
    values = "Infra"
  }
}

data "aws_subnet" "public_subnet" {
  vpc_id = "${data.aws_vpc.current.id}"

  filter {
    name   = "tag:Name"
    values = "infra_public"
  }
}

data "aws_subnet" "private_subnet" {
  vpc_id = "${data.aws_vpc.current.id}"

  filter {
    name   = "tag:Name"
    values = "infra_private"
  }
}
