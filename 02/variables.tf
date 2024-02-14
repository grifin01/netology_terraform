###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

/*variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJQuLbaFLBlRBhFV+wEgZ1+AHtpfGdZItmGwvKeBdjIx vish@DevOps"
  description = "ssh-keygen -t ed25519"
}*/

variable "metadata_map" {
  type = map (object ({
    serial-port-enable = number
    ssh-keys           = string
  }))
  default = {  
    "parameters"  = {
      serial-port-enable = 1
      ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJQuLbaFLBlRBhFV+wEgZ1+AHtpfGdZItmGwvKeBdjIx vish@DevOps"
    }
  }
}    

###yandex_compute_instance vars

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "VM's name"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "VM's platform type"
}

/*variable "vm_web_cores" {
  type        = number
  default     = "2"
  description = "VM's core value"
}

variable "vm_web_memory" {
  type        = number
  default     = "1"
  description = "VM's memory value"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = "5"
  description = "VM's core fraction value"
}*/

variable "vms_resources" {
  type = map (object ({
    cores = number
    memory = number
    core_fraction = number
  }))
  default = {  
    "web"  = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    "db"   = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }  
}

###yandex_compute_image vars

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM's image family"
}