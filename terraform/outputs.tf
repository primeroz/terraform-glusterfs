output "gluster01_private_ip" {
  value = "${aws_instance.gluster01.private_ip}"
}

output "gluster01_public_ip" {
  value = "${aws_instance.gluster01.public_ip}"
}

output "gluster02_private_ip" {
  value = "${aws_instance.gluster02.private_ip}"
}

output "gluster02_public_ip" {
  value = "${aws_instance.gluster02.public_ip}"
}

output "gluster-client_private_ip" {
  value = "${aws_instance.gluster-client.private_ip}"
}

output "gluster-client_public_ip" {
  value = "${aws_instance.gluster-client.public_ip}"
}

