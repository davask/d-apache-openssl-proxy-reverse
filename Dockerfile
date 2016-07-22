FROM davask/d-apache2:2.4-u14.04
MAINTAINER davask <contact@davaskweblimited.com>

LABEL dwl.server.proxy="proxy"

RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_ajp
RUN a2enmod deflate
RUN a2enmod proxy_balancer
RUN a2enmod proxy_connect
RUN a2enmod proxy_html
RUN a2enmod xml2enc

# Declare instantiation counter
ENV DWL_INIT_COUNT 2
# Copy instantiation specific file
COPY ./proxy-reverse.sh $DWL_INIT_DIR/$DWL_INIT_COUNT-proxy-reverse.sh
