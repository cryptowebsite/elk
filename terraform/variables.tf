variable "centos-7-base" {
  default = "fd8b2srp307fsql2fht4"
}

variable "debian-10-base" {
  default = "fd8ci1q50a9dc7822tel"
}

variable "zone" {
  type        = string
  description = "Availability zone for deployment"
  default     = "ru-central1-a"
}

variable "cores" {
  type        = number
  description = "Number of cores for instance"
  default     = 2
}

variable "memory" {
  type        = number
  description = "Number of memory for instance in GB"
  default     = 4
}

variable "cloud_id" {
  type        = string
  description = "Cloud id for deployment"
  default     = "b1gsvg57220fl1f4agtc"
}

variable "folder_id" {
  type        = string
  description = "Folder id for deployment"
  default     = "b1g8n8d6tmplil5u4286"
}

variable "token" {
  type        = string
  description = "YC token"
}