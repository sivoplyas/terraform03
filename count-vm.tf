data "yandex_compute_image" "ubuntu" {
  family = var.Name_OS
}
resource "yandex_compute_instance" "platform" {
  count = var.vm_number
  name            = "${var.vm_name_prefix}-${count.index+1}"
  hostname        = "${var.vm_name_prefix}-${count.index+1}"
  platform_id     = var.vm_platform_id
  depends_on  = [yandex_compute_instance.database]
  resources {
    cores         = var.vm_cores
    memory        = var.vm_memory
    core_fraction = var.vm_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id    = data.yandex_compute_image.ubuntu.image_id
      type        = var.vm_hdd_type
      size        = var.vm_hdd_size
    }
  }
  scheduling_policy {
    preemptible   = var.vm_preemptible
  }
  network_interface {
    subnet_id     = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat           = var.vm_nat
  }
  allow_stopping_for_update = var.vm_stopping_for_update
  metadata = {
    serial-port-enable = var.vm_serial_port_enable
    ssh-keys           = local.ssh_key
  }
}
