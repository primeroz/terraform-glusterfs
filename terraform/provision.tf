resource "null_resource" "provision_gluster-client" {
    depends_on = ["aws_instance.gluster-client","null_resource.provision_gluster01","null_resource.provision_gluster02"]
    triggers = {
        instance_id = "${aws_instance.gluster-client.id}"
    }
    connection {
        host = "${aws_instance.gluster-client.public_ip}"
        user = "${var.ssh_username}"
        key_file = "${var.ssh_keypath}"
        agent = false
    }

    provisioner "remote-exec" {
      inline = [
        "rm -f /tmp/001_base.sh",
        "touch /tmp/001_base.sh",
        "chmod 755 /tmp/001_base.sh",
        "cat <<FILEXXX > /tmp/001_base.sh",
        "${template_file.001_base.rendered}",
        "FILEXXX"
      ]
    }

    provisioner "file" {
        source = "scripts"
        destination = "/tmp/"
    }

    provisioner "remote-exec" {
      inline = [
        "/usr/bin/sudo /tmp/001_base.sh"
      ]
    }

}

resource "null_resource" "provision_gluster01" {
    depends_on = ["aws_instance.gluster01","null_resource.provision_gluster02"]
    triggers = {
        instance_id = "${aws_instance.gluster01.id}"
    }
    connection {
        host = "${aws_instance.gluster01.public_ip}"
        user = "${var.ssh_username}"
        key_file = "${var.ssh_keypath}"
        agent = false
    }

    provisioner "remote-exec" {
      inline = [
        "rm -f /tmp/001_base.sh",
        "touch /tmp/001_base.sh",
        "chmod 755 /tmp/001_base.sh",
        "cat <<FILEXXX > /tmp/001_base.sh",
        "${template_file.001_base.rendered}",
        "FILEXXX"
      ]
    }

    provisioner "file" {
        source = "scripts"
        destination = "/tmp/"
    }

    provisioner "remote-exec" {
      inline = [
        "/usr/bin/sudo /tmp/001_base.sh"
      ]
    }

}

resource "null_resource" "provision_gluster02" {
    depends_on = ["aws_instance.gluster02"]
    triggers = {
        instance_id = "${aws_instance.gluster02.id}"
    }
    connection {
        host = "${aws_instance.gluster02.public_ip}"
        user = "${var.ssh_username}"
        key_file = "${var.ssh_keypath}"
        agent = false
    }

    provisioner "remote-exec" {
      inline = [
        "rm -f /tmp/001_base.sh",
        "touch /tmp/001_base.sh",
        "chmod 755 /tmp/001_base.sh",
        "cat <<FILEXXX > /tmp/001_base.sh",
        "${template_file.001_base.rendered}",
        "FILEXXX"
      ]
    }

    provisioner "file" {
        source = "scripts"
        destination = "/tmp/"
    }

    provisioner "remote-exec" {
      inline = [
        "/usr/bin/sudo /tmp/001_base.sh",
        "/usr/bin/sudo /tmp/scripts/010_gluster_server.sh"
      ]
    }

}

