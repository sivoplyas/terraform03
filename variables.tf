###cloud vars
variable "token" {
  type        = string
  default     = ""
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  default     = ""
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = ""
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
  description = "vpc_name"
}

variable "Name_OS" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Name_OS"
}

variable "vm_number" {
  type        = number
  default     = 2
  description = "vm_number"
}

variable "vm_name_prefix" {
  type        = string
  default     = "web"
  description = "vm_name_prefix"
}

variable "vm_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "vm_platform_id"
}

variable "vm_cores" {
  type        = number
  default     = 2
  description = "vm_cores"
}

variable "vm_memory" {
  type        = number
  default     = 1
  description = "vm_memory"
}

variable "vm_core_fraction" {
 type        = number
  default     = 20
  description = "vm_core_fraction"
}

variable "vm_preemptible" {
  type        = bool
  default     = true
  description = "vm_preemptible"
}

variable "vm_stopping_for_update" {
  type        = bool
  default     = true
  description = "vm_stopping_for_update"
}

variable "vm_serial_port_enable" {
  type        = number
  default     = 0
  description = "vm_serial_port_enable"
}

variable "vm_hdd_type" {
  type        = string
  default     = "network-hdd"
  description = "vm_hdd_type"
}

variable "vm_hdd_size" {
  type        = number
  default     = 5
  description = "vm_hdd_size"
}

variable "vm_nat" {
  type        = bool
  default     = true
  description = "vm_nat"
}


variable "each_vm" {
  type = list(
     object({
        vm_name = string,
        vm_cpu = number,
        vm_ram = number,
        vm_core = number,
        disk_type = string,
        disk_volume = number,
        platform_id = string,
        preemptible = bool,
        use_nat = bool,
        stopping_for_update = bool,
        serial_port_enable = number
    })
  )
}

variable "storage_name" {
  type        = string
  default     = "storage"
  description = "storage_name"
}

variable "storage_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "storage_platform_id"
}

variable "storage_cores" {
  type        = number
  default     = 2
  description = "storage_cores"
}

variable "storage_memory" {
  type        = number
  default     = 1
  description = "storage_memory_GB"
}

variable "storage_core_fraction" {
 type        = number
  default     = 20
  description = "storage_core_fraction"
}

variable "storage_preemptible" {
  type        = bool
  default     = true
  description = "storage_preemptible"
}

variable "storage_stopping_for_update" {
  type        = bool
  default     = true
  description = "storage_stopping_for_update"
}

variable "storage_serial_port_enable" {
  type        = number
  default     = 0
  description = "storage_serial_port_enable"
}

variable "storage_hdd_type" {
  type        = string
  default     = "network-hdd"
  description = "storage_hdd_type"
}

variable "storage_hdd_size" {
  type        = number
  default     = 5
  description = "storage_hdd_size"
}

variable "storage_nat" {
  type        = bool
  default     = true
  description = "storage_nat"
}

variable "storage_secondary_disks_auto_delete" {
  type        = bool
  default     = false
  description = "storage_secondary_disks_auto_delete"
}

variable "storage_secondary_disks_mode" {
  type        = string
  default     = "READ_WRITE"
  description = "storage_secondary_disks_mode"
}

variable "volumes_number" {
  type        = number
  default     = 3
  description = "volumes_number"
}

variable "volume_name_prefix" {
  type        = string
  default     = "disk"
  description = "volume_name_prefix"
}

variable "volume_hdd_type" {
  type        = string
  default     = "network-hdd"
  description = "volume_hdd_type"
}

variable "volume_hdd_size" {
  type        = number
  default     = 1
  description = "volume_hdd_size"
}

variable "web_provision" {
  type        = bool
  default     = true
  description = "ansible provision switch variable"
}

variable "default_user" {
  type        = string
  default     = "dummy"
  description = "Default user via ssh"
}
