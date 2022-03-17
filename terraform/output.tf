#output "subnet_id" {
#  value = yandex_vpc_subnet.subnet1.id
#}

output "elasticsearch-centos_public_ip" {
  value = module.elasticsearch-centos.external_ip_address
}

output "elasticsearch-debian_public_ip" {
  value = module.elasticsearch-debian.external_ip_address
}

output "kibana-centos_public_ip" {
  value = module.kibana-centos.external_ip_address
}

output "kibana-debian_public_ip" {
  value = module.kibana-debian.external_ip_address
}

output "filebeat-centos_public_ip" {
  value = module.filebeat-centos.external_ip_address
}

output "filebeat-debian_public_ip" {
  value = module.filebeat-debian.external_ip_address
}
