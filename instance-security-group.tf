resource "aws_security_group" "lbitc_Jenkins_sg" {
    description = "Allow Jenkins,Http and Conditional ssh access"
    name = "lbitc_Jenkins_sg"
    vpc_id = var.my-vpc-id
 }

resource "aws_security_group_rule" "allow_http" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.lbitc_Jenkins_sg.id}"
}

resource "aws_security_group_rule" "allow_ssh" {
    count = var.instance_allow_ssh == true ? 1 : 0
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.lbitc_Jenkins_sg.id}"
  }

resource "aws_security_group_rule" "allow_jenkins" {
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.lbitc_Jenkins_sg.id}"
  }
resource "aws_security_group_rule" "allow_egress_all" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.lbitc_Jenkins_sg.id}"
}
