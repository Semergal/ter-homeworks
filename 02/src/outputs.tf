output "result" {

  value = [
    { web-develop = [yandex_compute_instance.platform-web-develop.network_interface.0.nat_ip_address, yandex_compute_instance.platform-web-develop.hostname, yandex_compute_instance.platform-web-develop.name,]},
    { db = [yandex_compute_instance.platform-db.network_interface.0.nat_ip_address, yandex_compute_instance.platform-db.hostname, yandex_compute_instance.platform-db.name]}
  ]
}