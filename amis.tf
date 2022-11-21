data "aws_ami" "base_ami" {
  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "tag:type"
    values = ["${var.base-ami-tag}"]
  }
  most_recent = true
}
####### variable.tf entry ########
variable "base-ami-tag" {
    description = "base-ami-tag"
    default = "base-ami-packer"
}
