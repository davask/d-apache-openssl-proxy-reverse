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
USER root
LABEL dwl.server.proxy=\"proxy\"" > ${rootDir}/Dockerfile
echo '
# http://stackoverflow.com/questions/7312215/is-there-a-way-to-remove-apaches-reverse-proxy-request-headers?answertab=votes#tab-top
# https://www.x4b.net/kb/RealIP-Apache

# install proxy
RUN a2enmod \
proxy \
proxy_http \
proxy_ajp \
deflate \
proxy_balancer \
proxy_connect \
proxy_html \
xml2enc

RUN chown root:sudo -R /dwl
USER admin
' >> ${rootDir}/Dockerfile

echo "Dockerfile generated with Apache:${branch}";
