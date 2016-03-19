FROM davask/d-apache2
MAINTAINER davask <contact@davaskweblimited.com>

LABEL dwl.server.proxy="apache2"

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get install -y apache2-utils
RUN apt-get install -y cpanminus

RUN rm -rf /var/lib/apt/lists/*

RUN cpanm YAML::XS

RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_ajp
RUN a2enmod deflate
RUN a2enmod proxy_balancer
RUN a2enmod proxy_connect
RUN a2enmod proxy_html
RUN a2enmod xml2enc

COPY ./dwl-yaml2virtualhost-0-proxy.pl /tmp/dwl-yaml2virtualhost-0-proxy.pl
COPY ./dwl-env2yaml-0-proxy.sh /tmp/dwl-env2yaml-0-proxy.sh
COPY ./dwl-init-2-proxy-reverse.sh /tmp/dwl-init-2-proxy-reverse.sh

