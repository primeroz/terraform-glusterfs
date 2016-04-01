resource "template_file" "001_base" {
    template = "${file("templates/001_base.sh")}"
    vars = {
        GLUSTER_VERSION = "${var.gluster_version}"
        GLUSTER_PATCH_VERSION = "${var.gluster_patch_version}"
        EPEL_VERSION = "${var.epel_version}"
        GLUSTER_CLIENT_PRIVATE_IP = "${aws_instance.gluster-client.private_ip}"
        GLUSTER_01_PRIVATE_IP = "${aws_instance.gluster01.private_ip}"
        GLUSTER_02_PRIVATE_IP = "${aws_instance.gluster02.private_ip}"
	GLUSTER_MASTER = "gluster01"
    }
}

