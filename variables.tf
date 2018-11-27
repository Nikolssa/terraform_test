variable "access_key" {}
variable "secret_key" {}
variable "cidrs" { type = "list" }
variable "region" {
  default = "eu-west-2"
}

variable "amis" {
  type = "map"
  default = {
    "eu-central-1" = "ami-086a09d5b9fa35dc7"
    "eu-west-2" = "ami-061a2d878e5754b62"
  }
}
