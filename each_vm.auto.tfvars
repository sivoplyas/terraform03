each_vm = [
 {
     vm_name = "main",
     vm_cpu = 2,
     vm_ram = 2,
     vm_core = 20,
     disk_type = "network-hdd",
     disk_volume = 5,
     platform_id = "standard-v1",
     preemptible = true,
     use_nat = true,
     stopping_for_update = true,
     serial_port_enable = 0
  },
  {
     vm_name = "replica",
     vm_cpu = 2,
     vm_ram = 1,
     vm_core = 20,
     disk_type = "network-hdd",
     disk_volume = 6,
     platform_id = "standard-v1",
     preemptible = true,
     use_nat = true,
     stopping_for_update = true,
     serial_port_enable = 0
  }
 ]
