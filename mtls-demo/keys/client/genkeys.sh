#!/usr/bin/env sh

# generate private key
openssl genrsa -out authenticated.pem 2048

# generate CSR and sign with CA's private key
openssl req -new -key authenticated.pem -out certificate.csr
openssl x509 -req -days 365 -in certificate.csr -CA ../ca/ca.cert -CAkey ../ca/private.pem -CAcreateserial -out authenticated.cert
rm certificate.csr

# generate self signed cert
openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout unauthenticated.pem -out unauthenticated.cert

