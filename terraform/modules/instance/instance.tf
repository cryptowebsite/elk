resource "yandex_compute_instance" "instance" {
  name                      = var.host_name
  zone                      = var.zone
  hostname                  = "${var.host_name}.netology.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    initialize_params {
      image_id    = var.image
      name        = "root-${var.host_name}"
      type        = "network-nvme"
      size        = "20"
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}
