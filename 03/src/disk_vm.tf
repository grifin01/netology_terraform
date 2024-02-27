resource "yandex_compute_disk" "storage_1" {
  count   = 3
  name    = "disk-${count.index + 1}"
  size    = var.vms_resources.storage_vm.disk_volume
}


resource "yandex_compute_instance" "storage" {
  name = "storage"
  resources {
    cores         = var.vms_resources.storage_vm.cpu
    memory        = var.vms_resources.storage_vm.ram
    core_fraction = var.vms_resources.storage_vm.core_fraction
  }

  boot_disk {
    initialize_params {
    image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
        }
  }

  dynamic "secondary_disk" {
    for_each = toset(yandex_compute_disk.storage_1[*].id)
#   for_each = { for stor in yandex_compute_disk.storage_1[*]: stor.name=> stor }
   content {
     disk_id = secondary_disk.key
   }
  }
  network_interface {
     subnet_id = yandex_vpc_subnet.develop.id
     nat     = true
  }

  metadata = local.vm_metadata
}
