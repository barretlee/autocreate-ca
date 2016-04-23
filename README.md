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
