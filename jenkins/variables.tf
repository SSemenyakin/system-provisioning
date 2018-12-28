#
#Jenkins variables
#

#System
variable "key_name" {
  description = "SSH key for Jenkins"
  default     = "provisioning.pem"
}

#Instance specific
variable "master_instance_type" {
  default = "t2.micro"
}

variable "master_instance_name" {
  default = "jenkins_master"
}

variable "associate_public_ip_address" {
  default = "true"
}


#SG specific variable
variable "master_ingress_rules" {
  type = "list"

  default = [
    ["22", "22", "tcp", "0.0.0.0/0", "SSH access from anywhere"],
    ["8080", "8080", "tcp", "0.0.0.0/0", "HTTP from anywhere"],
  ]
}

variable "master_egress_rules" {
  type = "list"

  default = [
    ["22", "22", "tcp", "0.0.0.0/0", "SSH access from anywhere"],
    ["8080", "8080", "tcp", "0.0.0.0/0", "HTTP from anywhere"],
  ]
}

variable "slave_ingress_rules" {
  type = "list"

  default = [
    ["22", "22", "tcp", "0.0.0.0/0", "SSH access from anywhere"],
  ]
}

variable "slave_egress_rules" {
  type = "list"

  default = [
    ["22", "22", "tcp", "0.0.0.0/0", "SSH access from anywhere"],
  ]
}

#IAM specific variable

variable "jenkins_instance_profile" {
  description = "Instance profile name for Jenkins"
  default     = "jenkins_instance_profile"
}

variable "jenkins_role" {
  default     = "jenkins_instance_role"
  description = "Role for Jenkins`s instance"
}

variable "AZ" {
  type = "list"

  default = ["us-east-1a"]
}