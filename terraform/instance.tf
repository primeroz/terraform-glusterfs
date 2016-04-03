resource "aws_security_group" "glusterfs_default" {
  name = "glusterfs_default"
  description = "Allow Traffic required by the glusterfs test environment"

  vpc_id = "${var.vpc_id}"

  ingress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      self = true
	}

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

	egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "glusterfs_default"
  }
}

resource "aws_instance" "gluster01" {
    connection {
        user = "${var.ssh_username}"
        key_file = "${var.ssh_keypath}"
        agent = false
    }
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    key_name = "${var.ssh_keyname}"

    subnet_id = "${var.subnet_id}"
    associate_public_ip_address = true

    vpc_security_group_ids = [ "${aws_security_group.glusterfs_default.id}" ] 

    tags = {
        Name = "gluster01"
        project = "${var.project}"
        environment = "${var.env}"
        role = "master"
    }


}

resource "aws_instance" "gluster02" {
    connection {
        user = "${var.ssh_username}"
        key_file = "${var.ssh_keypath}"
        agent = false
    }
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    key_name = "${var.ssh_keyname}"

    subnet_id = "${var.subnet_id}"
    associate_public_ip_address = true

    vpc_security_group_ids = [ "${aws_security_group.glusterfs_default.id}" ] 

    tags = {
        Name = "gluster02"
        project = "${var.project}"
        environment = "${var.env}"
        role = "node"
    }

}


resource "aws_instance" "gluster-client" {
    connection {
        user = "${var.ssh_username}"
        key_file = "${var.ssh_keypath}"
        agent = false
    }
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    key_name = "${var.ssh_keyname}"

    subnet_id = "${var.subnet_id}"
    associate_public_ip_address = true

    vpc_security_group_ids = [ "${aws_security_group.glusterfs_default.id}" ] 

    tags = {
        Name = "gluster-client"
        project = "${var.project}"
        environment = "${var.env}"
    }

}

resource "aws_ebs_volume" "gluster01_brick1" {
  availability_zone = "${aws_instance.gluster01.availability_zone}"
  size = 30
}

resource "aws_ebs_volume" "gluster02_brick1" {
  availability_zone = "${aws_instance.gluster02.availability_zone}"
  size = 30
}

resource "aws_volume_attachment" "gluster01_brick1_attachment" {
  device_name = "/dev/xvdh"
  volume_id = "${aws_ebs_volume.gluster01_brick1.id}"
  instance_id = "${aws_instance.gluster01.id}"
}

resource "aws_volume_attachment" "gluster02_brick1_attachment" {
  device_name = "/dev/xvdh"
  volume_id = "${aws_ebs_volume.gluster02_brick1.id}"
  instance_id = "${aws_instance.gluster02.id}"
}

