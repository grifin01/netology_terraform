output "vm_web_parameters" {
  value = {
    instance_name = yandex_compute_instance.platform_web.name
    external_ip   = yandex_compute_instance.platform_web.network_interface[0].nat_ip_address
    fqdn          = yandex_compute_instance.platform_web.fqdn
  }
  description = "vm_web_parameters"
}

output "vm_db_parameters" {
  value = {
    instance_name = yandex_compute_instance.platform_db.name
    external_ip   = yandex_compute_instance.platform_db.network_interface[0].nat_ip_address
    fqdn          = yandex_compute_instance.platform_db.fqdn
  }  
  description = "vm_db_parameters"
}