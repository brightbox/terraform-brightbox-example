// Brightbox terraform example.
// Builds a Web server and a MySQL server, gives them both Cloud IPs and sets up firewalling.
// See https://www.brightbox.com/docs/guides/terraform/getting-started for more details

resource "brightbox_cloudip" "webip" {
  target = "${brightbox_server.webserver.interface}"
  name = "web ip"
}

resource "brightbox_server" "webserver" {
  image = "img-8pcus"
  name = "web server"
  server_groups = ["${brightbox_server_group.webservers.id}"]
  depends_on = ["brightbox_firewall_policy.webservers"]
}

resource "brightbox_server_group" "webservers" {
  name = "web servers"
}


resource "brightbox_cloudip" "db" {
  target = "${brightbox_database_server.db.id}"
  name = "db ip"
}

resource "brightbox_database_server" "db" {
  name = "db server"
  database_engine = "mysql"
  database_version = "5.6"
  maintenance_weekday = 6
  maintenance_hour = 2
  allow_access = ["${brightbox_server_group.webservers.id}"]
}


resource "brightbox_firewall_policy" "webservers" {
  name = "web servers"
  server_group = "${brightbox_server_group.webservers.id}"
}

resource "brightbox_firewall_rule" "webservers_ssh" {
    destination_port = 22
    protocol = "tcp"
    source = "any"
    description = "SSH access from anywhere"
    firewall_policy = "${brightbox_firewall_policy.webservers.id}"
}

resource "brightbox_firewall_rule" "webservers_web" {
    destination_port = "80,443"
    protocol = "tcp"
    source = "any"
    description = "HTTP/S access from anywhere"
    firewall_policy = "${brightbox_firewall_policy.webservers.id}"
}

resource "brightbox_firewall_rule" "webservers_outbound" {
    destination = "any"
    description = "Outbound internet access"
    firewall_policy = "${brightbox_firewall_policy.webservers.id}"
}

