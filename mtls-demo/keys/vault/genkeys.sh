#!/usr/bin/env sh

# generate private key
openssl genrsa -out private.pem 2048

# generate CSR and sign with CA's private key
openssl req -new -key private.pem -out certificate.csr
openssl x509 -req -days 365 -in certificate.csr -CA ../ca/ca.cert -CAkey ../ca/private.pem -CAcreateserial -out vault.cert
rm certificate.csr

# generate a certificate chain
cat vault.cert ../ca/ca.cert > chain.cert

