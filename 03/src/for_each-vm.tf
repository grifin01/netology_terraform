resource "yandex_compute_instance" "db" {
  depends_on = [ yandex_compute_instance.web ]
  for_each = { for key, value in var.each_vm : key => value }
  name        = "netology-develop-platform-db-${each.value.vm_name}"
  platform_id = "standard-v1"

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = "network-hdd"
      size     = each.value.disk_volume
    }
  }

  metadata = local.vm_metadata

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  allow_stopping_for_update = true
}