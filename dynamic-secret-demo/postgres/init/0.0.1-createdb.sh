#!/usr/bin/env sh

set -eu

psql <<EOF
  CREATE DATABASE ${DB_NAME};
EOF