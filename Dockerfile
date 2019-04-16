FROM vault:1.1.1

COPY config.hcl /etc/vault/config.hcl

CMD vault server -config /etc/vault/config.hcl