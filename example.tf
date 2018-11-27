provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "example" {
  ami           = "ami-0b0a60c0a2bd40612"
  instance_type = "t2.micro"

  depends_on = ["aws_s3_bucket.example"]

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }

}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}

resource "aws_s3_bucket" "example" {
  bucket = "terraform-for-niko-test"
  acl = "private"
}
