###yandex_compute_instance vars

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "VM's name"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "VM's platform type"
}

/*variable "vm_db_cores" {
  type        = number
  default     = "2"
  description = "VM's core value"
}

variable "vm_db_memory" {
  type        = number
  default     = "2"
  description = "VM's memory value"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = "20"
  description = "VM's core fraction value"
}*/

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "VM's zone"
}

variable "vm_db_cidr" {
  type        = list(string)
  default     = ["192.168.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_subnet_name_2" {
  type        = string
  default     = "db"
  description = "subnet name"
}

###yandex_compute_image vars

variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM's image family"
}