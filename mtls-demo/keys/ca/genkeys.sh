#!/usr/bin/env sh

# generate private key
openssl genrsa -out private.pem 2048

# generate CSR and sign with own private key
openssl req -new -key private.pem -out certificate.csr
openssl x509 -req -days 365 -in certificate.csr -signkey private.pem -out ca.cert
rm certificate.csr
