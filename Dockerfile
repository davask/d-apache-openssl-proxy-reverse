FROM davask/d-apache-openssl:2.4-d8.8
MAINTAINER davask <docker@davaskweblimited.com>
USER root
LABEL dwl.server.proxy="proxy"

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

COPY ./build/dwl/default/etc/apache2/sites-available/* /dwl/default/etc/apache2/sites-available/
RUN cp -rdf /dwl/default/etc/apache2/sites-available/_proxy-rules.conf /etc/apache2/sites-available/_proxy-rules.conf

RUN chmod +x /dwl/init.sh && chown root:sudo -R /dwl
USER admin
