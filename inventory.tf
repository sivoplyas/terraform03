#resource "local_file" "hosts_templatefile" {
#  content = templatefile("${path.module}/hosts.tftpl",

#  { webservers = yandex_compute_instance.example })

#  filename = "${abspath(path.module)}/hosts.ini"
#}

#  %{if length(yandex_compute_instance.database) > 0}


resource "local_file" "hosts_for" {
  content =  <<-EOT
  %{if length(yandex_compute_instance.platform) > 0}
  [webservers]
  %{for i in yandex_compute_instance.platform }
  %{if var.vm_nat}
  ${i["name"]}   ansible_host=${i["network_interface"][0]["nat_ip_address"]}
  %{else}
  ${i["name"]}   ansible_host=${i["network_interface"][0]["ip_address"]}
  %{endif}
  %{endfor}
  %{endif}
  %{if length(yandex_compute_instance.database) > 0}
  [database]
  %{for i in yandex_compute_instance.database }
  ${i["name"]}   ansible_host=${i["network_interface"][0]["nat_ip_address"]}
  [all:vars]
  ansible_ssh_common_args='-o ProxyCommand="ssh -i ${var.private_key_path} -p 22 -W %h:%p -q ubuntu@${i["network_interface"][0]["nat_ip_address"]}"'
  %{endfor}
  %{endif}
  EOT
  filename = "${abspath(path.module)}/for.ini"
}

locals{
   instances_yaml = concat(yandex_compute_instance.platform, [ yandex_compute_instance.storage ], [ yandex_compute_instance.database["main"] ], [ yandex_compute_instance.database["replica"] ])
}

resource "local_file" "hosts_yaml" {
  content =  <<-EOT
  all:
    hosts:
    %{ for i in local.instances_yaml ~}
  ${i["name"]}:
          ansible_host: ${i["network_interface"][0]["nat_ip_address"]}
          ansible_user: ubuntu
    %{ endfor ~}
  EOT
  filename = "${abspath(path.module)}/hosts.yaml"
}
