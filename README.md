# Cloudflare DNS Updater

container friendly version mscribellito's code here: https://github.com/mscribellito/Cloudfare-DNS-Updater

## Cloudflare setup

1. A domain you control that has NS records pointing to Cloudfare's nameservers
2. the target dynamic dns record ( ZONE_R ) must already exist; so create it manually first pointing to eg 127.0.0.1 in the web gui


# Docker

```
docker pull simonczuzu/cloudflare-ddns:latest
```

see below for an example of how to use it with eg docker-compose

the hashed out values are defaults that can be changed if you want 

SLEEP is how long the process waits if it detects your IP hasn't changed

# Example docker-compose file

```
version: '3'

services:
    cf_ddns:
      image: cf_ddns
      container_name: cf_ddns
      restart: unless-stopped
      hostname: cf_ddns
      environment:
#        - DDNS_URL=http://ipv4.icanhazip.com
#        - API_URL=https://api.cloudflare.com/client/v4/zones
#        - SLEEP=3600
        - AUTH_EMAIL=email@email.email
        - AUTH_KEY=kekekekekekeyy123
        - ZONE=mydnszone.com
        - ZONE_R=home.mydnszone.com
```


