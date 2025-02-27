resource "yandex_compute_instance" "database" {
  for_each = {for vm in var.each_vm: vm.vm_name => vm}
  name            = each.value.vm_name
  hostname        = each.value.vm_name
  platform_id     = each.value.platform_id
  resources {
    cores         = each.value.vm_cpu
    memory        = each.value.vm_ram
    core_fraction = each.value.vm_core
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = each.value.disk_type
      size     = each.value.disk_volume
    }
  }
  scheduling_policy {
    preemptible = each.value.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat       = each.value.use_nat
  }
  allow_stopping_for_update = each.value.stopping_for_update
  metadata = {
    serial-port-enable = each.value.serial_port_enable
    ssh-keys           = local.ssh_key
  }
}
