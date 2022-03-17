variable "cloud_id" {
  type        = string
  description = "Cloud id for deployment"
}

variable "folder_id" {
  type        = string
  description = "Folder id for deployment"
}

variable "subnet_id" {
  type        = string
  description = "Subnet id for deployment"
}

variable "image" {
  type        = string
  description = "Image id for instance"
}

variable "cores" {
  type = number
  description = "Number of cores for instance"
}

variable "memory" {
  type = number
  description = "Number of memory for instance in GB"
}

variable "zone" {
  type        = string
  description = "Availability zone for deployment"
}

variable "host_name" {
  type        = string
  description = "Name of host"
}