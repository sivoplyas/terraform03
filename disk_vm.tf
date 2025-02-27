resource "yandex_compute_disk" "volume" {
  count = var.volumes_number
  name = "${var.volume_name_prefix}-${count.index+1}"
  size = var.volume_hdd_size
  type = var.volume_hdd_type
  zone = var.default_zone
}

resource "yandex_compute_instance" "storage" {
  name            = var.storage_name
  hostname        = var.storage_name
  platform_id     = var.storage_platform_id
  resources {
    cores         = var.storage_cores
    memory        = var.storage_memory
    core_fraction = var.storage_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id    = data.yandex_compute_image.ubuntu.image_id
      type        = var.storage_hdd_type
      size        = var.storage_hdd_size
    }
  }
  scheduling_policy {
    preemptible   = var.storage_preemptible
  }
  network_interface {
    subnet_id     = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat           = var.storage_nat
  }
  allow_stopping_for_update = var.storage_stopping_for_update
  metadata = {
    serial-port-enable = var.storage_serial_port_enable
    ssh-keys           = local.ssh_key
  }
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.volume
    content {
      disk_id     = lookup(secondary_disk.value, "id", null)
      auto_delete = var.storage_secondary_disks_auto_delete
      mode        = var.storage_secondary_disks_mode
    }
  }
}
