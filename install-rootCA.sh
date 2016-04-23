[ -d /root/ca ] || mkdir root;
cp cnf/root-ca /root/ca/openssl.cnf
cd /root/ca;
mkdir certs crl newcerts private;
chmod 700 private;
touch index.txt;
echo 1000 > serial;
openssl genrsa -aes256 -out private/ca.key.pem 4096;
chmod 400 private/ca.key.pem;
openssl req -config openssl.cnf \
      -key private/ca.key.pem \
      -new -x509 -days 7300 -sha256 -extensions v3_ca \
      -out certs/ca.cert.pem;
chmod 444 certs/ca.cert.pem;
openssl x509 -noout -text -in certs/ca.cert.pem;