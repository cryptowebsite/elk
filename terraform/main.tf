module "elasticsearch-centos" {
  source = "./modules/instance"
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  subnet_id = yandex_vpc_subnet.subnet1.id
  zone = var.zone
  image = var.centos-7-base
  cores = var.cores
  memory = var.memory
  host_name = "elasticsearch-centos"
}

module "elasticsearch-debian" {
  source = "./modules/instance"
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  subnet_id = yandex_vpc_subnet.subnet1.id
  zone = var.zone
  image = var.debian-10-base
  cores = var.cores
  memory = var.memory
  host_name = "elasticsearch-debian"
}

module "kibana-centos" {
  source = "./modules/instance"
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  subnet_id = yandex_vpc_subnet.subnet1.id
  zone = var.zone
  image = var.centos-7-base
  cores = var.cores
  memory = var.memory
  host_name = "kibana-centos"
}

module "kibana-debian" {
  source = "./modules/instance"
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  subnet_id = yandex_vpc_subnet.subnet1.id
  zone = var.zone
  image = var.debian-10-base
  cores = var.cores
  memory = var.memory
  host_name = "kibana-debian"
}

module "filebeat-centos" {
  source = "./modules/instance"
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  subnet_id = yandex_vpc_subnet.subnet1.id
  zone = var.zone
  image = var.centos-7-base
  cores = var.cores
  memory = var.memory
  host_name = "filebeat-centos"
}

module "filebeat-debian" {
  source = "./modules/instance"
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  subnet_id = yandex_vpc_subnet.subnet1.id
  zone = var.zone
  image = var.debian-10-base
  cores = var.cores
  memory = var.memory
  host_name = "filebeat-debian"
}