resource "yandex_compute_instance" "web" {
  count = 2

  name        = "netology-develop-platform-web-${count.index + 1}"
  platform_id = "standard-v1"

  resources {
    cores         = var.vms_resources.count_vm.cpu
    memory        = var.vms_resources.count_vm.ram
    core_fraction = var.vms_resources.count_vm.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = "network-hdd"
      size     = var.vms_resources.count_vm.disk_volume
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${var.public_key}"
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
  allow_stopping_for_update = true
}
