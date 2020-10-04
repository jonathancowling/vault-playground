storage "file" {
  path = "vault/data"
}

listener "tcp" {
  address = "0.0.0.0:8200"
  tls_cert_file = "/vault/tls/chain.cert"
  tls_key_file = "/vault/tls/private.pem"
  tls_client_ca_file = "/vault/ca/ca.cert"
  tls_require_and_verify_client_cert = "true"
}

ui = true
disable_mlock = true
