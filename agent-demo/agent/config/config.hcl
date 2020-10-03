pid_file = "/tmp/pid"

vault {
  address = "http://vault:8200"
}

auto_auth {
  method {
    type = "approle"
    config = {
      role_id_file_path = "/etc/vault/agent/role/id"
    }
  }

  sink "file" {
    wrap_ttl = "30s"
    config = {
      path = "/tmp/token"
    }
  }
}

template {
  contents = "{{ with secret \"secret/data/web?\" }}{{ .Data | toJSONPretty }}{{ end }}"
  destination = "/vault/data/templateOutput/index.txt"
}