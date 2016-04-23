cd /root/ca;
openssl genrsa -aes256 \
      -out intermediate/private/www.barretlee.com.key.pem 2048;
chmod 400 intermediate/private/www.barretlee.com.key.pem;
openssl req -config intermediate/openssl.cnf \
      -key intermediate/private/www.barretlee.com.key.pem \
      -new -sha256 -out intermediate/csr/www.barretlee.com.csr.pem;
openssl ca -config intermediate/openssl.cnf \
      -extensions server_cert -days 375 -notext -md sha256 \
      -in intermediate/csr/www.barretlee.com.csr.pem \
      -out intermediate/certs/www.barretlee.com.cert.pem;
chmod 444 intermediate/certs/www.barretlee.com.cert.pem;
openssl x509 -noout -text \
      -in intermediate/certs/www.barretlee.com.cert.pem;
openssl verify -CAfile intermediate/certs/ca-chain.cert.pem \
      intermediate/certs/www.barretlee.com.cert.pem;
