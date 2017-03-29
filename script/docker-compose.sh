#/usr/bin/env bash

branch=${1};
parentBranch=${2};
rootDir=${3};
buildDir=${4};

######################
# docker-compose.yml #
######################

echo "d-apache-openssl-proxy-reverse:
  ports:
  - 80:80/tcp
  - 2222:22/tcp
  - 443:443/tcp
  environment:
    DWL_LOCAL: en_US.UTF-8
    DWL_USER_ID: '1000'
    DWL_USER_PASSWD: secret
    DWL_LOCAL_LANG: en_US:en
    DWL_USER_NAME: username
    DWL_SSH_ACCESS: 'true'
    DWL_SSLKEY_C: EU
    DWL_SSLKEY_ST: France
    DWL_SSLKEY_L: Vannes
    DWL_SSLKEY_O: davask web limited - docker container
    DWL_SSLKEY_CN: davaskweblimited.com
  log_driver: syslog
  labels:
    io.rancher.scheduler.affinity:host_label: dwl=dwlComPrivate
  image: davask/d-apache-openssl-proxy-reverse:${branch}
  hostname: private.davaskweblimited.com
  volumes:
  - ${rootDir}/volumes/home/username/files:/home/username/files
  - ${rootDir}/volumes/home/username/http/app/sites-available:/etc/apache2/sites-available
  - ${rootDir}/volumes/etc/apache2/ssl:/etc/apache2/ssl
  working_dir: /var/www/html
" > ${rootDir}/docker-compose.yml

echo "docker-compose.yml generated with apache-proxy-reverse:${branch}";
