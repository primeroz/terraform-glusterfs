variable "access_key" {
    description = "AWS access key."
}

variable "secret_key" {
    description = "AWS secret key."
}

variable "region" {
    description = "The AWS region to create things in."
    default = "eu-west-1"
}

variable "ssh_keyname" {
    description = "Name of the keypair to use in EC2."
    default = "przchrome"
}

variable "ssh_keypath" {
    descriptoin = "Path to your private key."
    default = "~/.ssh/przchrome.pem"
}

variable "ssh_username" {
    descriptoin = "SSH Username"
    default = "root"
}

variable "ami" {
    description = "Centos 6 AMI"
    default = "ami-edb9069e"
}

variable "subnet_id" {
    description = "A subnet ID where to start the instance. Probably the default VPC" 
}

variable "vpc_id" {
    description = "VPC_ID" 
}

variable "project" {
    description = "Project name"
}

variable "env" {
    description = "Project Environment"
}

variable "instance_type" {
    description = "Instance Type"
    default = "t2.micro"
}

variable "epel_version" {
    description = "EPEL Version"
    default = "6-8"
}

variable "gluster_patch_version" {
    description = "Gluster Patch Version"
    default = "3.7.9"
}

variable "gluster_version" {
    description = "Gluster Version"
    default = "3.7"
}

variable "volume_type" {
    description = "RAID Volume Type"
    default = "mirror"
}


