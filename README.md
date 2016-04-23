# autocreate-ca

Autocreate cetificate authority, [detail in Chinese](http://www.barretlee.com/blog/2016/04/24/detail-about-ca-and-certs/).

## Usage

Download shell:

```bash
git clone https://github.com/barretlee/autocreate-ca.git;
cd autocreate-ca;
chmod +x *.sh;
```

Defatult install path: `/root/ca`, you can replace it in the files below.

```bash
sh ./install-rootCA.sh
sh ./install-intermediateCA.sh
# fg. www.barretlee.com 
sh ./install-websiteConfig.sh
```

## check

Dblclick `/root/ca/intermediate/certs/ca-chain.cert.pem` and install the certs.

Add one line to `/etc/hosts`，`www.barretlee.com` is the Common Name setted in file `install-websiteConfig.sh`, you can change it.

```
127.0.0.1 www.barretlee.com
```

Then run the code below:

```javascript
// https-server.js
var https = require('https');
var fs = require('fs');

var options = {
  key: fs.readFileSync('/root/ca/intermediate/private/www.barretlee.com.key.pem'),
  cert: fs.readFileSync('/root/ca/intermediate/certs/www.barretlee.com.cert.pem'),
  passphrase: 'passoword' // 如果生成证书的时候设置了密码，请添加改参数和密码
};

https.createServer(options, function(req, res) {
  res.writeHead(200);
  res.end('hello world');
}).listen(8000, function(){
  console.log('Open URL: https://www.barretlee.com:8000');
});
```

And you will see:

![](http://ww1.sinaimg.cn/large/6c0378f8gw1f373ltah7zj20oc09aaan.jpg)

The detail of cert:

![](http://ww4.sinaimg.cn/large/6c0378f8gw1f373mf9bpfj20qw0u6n3d.jpg)

## LICENSE & Thanks

MIT.

Thanks for <https://jamielinux.com/docs/openssl-certificate-authority/index.html>.
