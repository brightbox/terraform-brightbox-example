output "web public ip address" {
  value = "${brightbox_cloudip.webip.fqdn}"
}

output "db ip address" {
  value = "${brightbox_cloudip.db.fqdn}"
}

output "db admin account password" {
  value = "${brightbox_database_server.db.admin_password}"
}
