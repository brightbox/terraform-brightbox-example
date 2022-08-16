// You can sets these here or use environment variables named:
// BRIGHTBOX_ACCOUNT
// BRIGHTBOX_USER_NAME
// BRIGHTBOX_PASSWORD

provider "brightbox" {
  username  = var.username
  password  = var.password
  account   = var.account
}
