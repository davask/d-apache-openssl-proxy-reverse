# dockerfile

[![[dwl] apache-openssl-proxy-reverse:2.4-u14.04 in prod][badge-shields]](https://hub.docker.com/r/davask/d-apache-openssl-proxy-reverse/)
[![[dwl] apache-openssl-proxy-reverse:2.4-u14.04 license][badge-license]](https://app.fossa.io/projects/git%2Bhttps%3A%2F%2Fgithub.com%2Fdavask%2Fd-apache-openssl-proxy-reverse?ref=badge_shield)

[![[dwl] apache-openssl-proxy-reverse:2.4-u14.04 image][badge-docker]](https://hub.docker.com/r/davask/d-apache-openssl-proxy-reverse/)

[badge-docker]: https://dockeri.co/image/davask/d-apache-openssl-proxy-reverse "[dwl] apache-openssl-proxy-reverse:2.4-u14.04 image"
[badge-shields]: https://img.shields.io/badge/davask%2Fd--apache--openssl--proxy--reverse-env_prod-brightgreen.svg?style=flat "[dwl] apache-openssl-proxy-reverse:2.4-u14.04 in prod"
[badge-license]: https://img.shields.io/badge/davask%2Fd--apache--openssl--proxy--reverse-license_MIT-brightgreen.svg?style=flat "[dwl] apache-openssl-proxy-reverse:2.4-u14.04 license"

## Exposed port

- 22
- 80
- 443
## Default ENV values

- DWL_LOCAL_LANG: 'en_US:en'
- DWL_LOCAL: 'en_US.UTF-8'
- DWL_USER_NAME: 'username'
- DWL_USER_PASSWD: 'secret'
- DWL_USER_ID: '1000'
- DWL_SUDO_USER: 'false'
- DWL_SSH_ACCESS: 'false'
- APACHE_LOCK_DIR: '/var/lock/apache2'
- APACHE_PID_FILE: '/var/run/apache2.pid'
- APACHE_RUN_USER: 'www-data'
- APACHE_RUN_GROUP: 'www-data'
- APACHE_LOG_DIR: '/var/log/apache2'
- APACHE_RUN_DIR: '/var/run/apache2'
- DWL_HTTP_SERVERADMIN: 'admin@localhost'
- DWL_HTTP_DOCUMENTROOT: '/var/www'
- DWL_HTTP_SHIELD: 'false'
- DWL_SSLKEY_C: 'EU'
- DWL_SSLKEY_ST: 'France'
- DWL_SSLKEY_L: 'Vannes'
- DWL_SSLKEY_O: 'davask web limited - docker container'
- DWL_SSLKEY_CN: 'davaskweblimited.com'
- APACHE_SSL_DIR: '/etc/apache2/ssl'
## Available volumes

- /home/host
- /etc/apache2/sites-available
- /etc/apache2/ssl
## LABEL

- dwl.server.os="apache-openssl 2.4-u14.04"

- dwl.server.base="apache-openssl-proxy-reverse 2.4-u14.04"

- dwl.server.http="apache 2.4-u14.04"

## EXTRA

