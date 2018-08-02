variable "image_desc" {
  description = "Image pattern to use to select boot image"
  default     = "^ubuntu-bionic.*server$"
}

variable "webserver_type" {
  description = "Type of server to use as web server"
  default     = "2gb.ssd"
}
