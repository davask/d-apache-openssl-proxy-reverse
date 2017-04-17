#/usr/bin/env bash

branch=${1};
parentBranch=${2};
rootDir=${3};
buildDir=${4};

##############
# Dockerfile #
##############

echo "FROM davask/d-apache-openssl:${parentBranch}
MAINTAINER davask <docker@davaskweblimited.com>
LABEL dwl.server.proxy=\"proxy\"" > ${rootDir}/Dockerfile
echo '
# http://stackoverflow.com/questions/7312215/is-there-a-way-to-remove-apaches-reverse-proxy-request-headers?answertab=votes#tab-top
# https://www.x4b.net/kb/RealIP-Apache

# install proxy
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_ajp
RUN a2enmod deflate
RUN a2enmod proxy_balancer
RUN a2enmod proxy_connect
RUN a2enmod proxy_html
RUN a2enmod xml2enc

' >> ${rootDir}/Dockerfile

echo "Dockerfile generated with Apache:${branch}";
