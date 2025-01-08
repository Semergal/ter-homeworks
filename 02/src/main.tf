resource "yandex_vpc_network" "develop" {
  name = var.cloud.develop.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.cloud.develop.vpc_name
  zone           = var.cloud.develop.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.cloud.develop.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm.web-develop.image
}
resource "yandex_compute_instance" "platform-web-develop" {
  name        = "${local.project}-${local.function}-${local.instance}-web-develop"
  platform_id = "standard-v1"
  resources {
    cores         = var.vm.web-develop.cores
    memory        = var.vm.web-develop.memory
    core_fraction = var.vm.web-develop.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}
resource "yandex_compute_instance" "platform-db" {
  name        = "${local.project}-${local.function}-${local.instance}-db"
  platform_id = "standard-v1"
  resources {
    cores         = var.vm.db.cores
    memory        = var.vm.db.memory
    core_fraction = var.vm.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}