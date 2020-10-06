storage "file" {
  path = "vault/data"
}

listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = 1
}

seal "transit" {
  address = "http://vault_root:8200"
  disable_renewal = "false"
  key_name = "autounseal"
  mount_path = "transit/"
  tls_skip_verify = "true"
}

ui = true
disable_mlock = true
