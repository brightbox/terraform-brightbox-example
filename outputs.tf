output "web_public_ip_address" {
  value = brightbox_cloudip.webip.fqdn
}

output "db_ip_address" {
  value = brightbox_cloudip.db.fqdn
}

output "db_admin_account_password" {
  value = brightbox_database_server.db.admin_password
  sensitive = true
}
