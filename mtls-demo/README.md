# mTLS Demo

## Installation

This demo requires the following software to be installed:
- docker-compose
- openssl
- sh

## Running

To run this demo first generate the required keys using the shell script `genallkeys.sh`.
E.g.
```sh
cd ./keys
./genallkeys.sh
```

The script generates 4 keys in the following order:
0. certificate authority
0. vault
0. client with a certificate signed by the client CA (authenticated client)
0. client with a self-signed certificate (unauthenticated client)

The keys generated must have a common name,
vault's common name must be the hostname that's being used to connect to it (`localhost`),
all other fields may be left blank.

> This demo doesn't support encrypting vault's private key
> because vault prompts for the password on start (this is not recommended in production).

Next start vault by using the docker compose file.
E.g.
```sh
docker-compose up
```

Finally communicate with the server using cURL,
vault should now only accept connections from clients with certificated signed by the CA.
E.g.
```sh
curl https://localhost:8200/sys/health # fails because vault's CA isn't trusted by the client

curl --cacert keys/ca/ca.cert https://localhost:8200/sys/health # fails because the client isn't providing a certificate

curl --cacert keys/ca/ca.cert \
     --cert ./keys/client/unauthenticated.cert \
     --key ./keys/client/unauthenticated.pem \
     https://localhost:8200/sys/health # fails because the client's CA (self-signed) isn't trusted by vault

curl --cacert keys/ca/ca.cert \
     --cert ./keys/client/authenticated.cert \
     --key ./keys/client/authenticated.pem \
     https://localhost:8200/sys/health # connects successfully using mTLS
```