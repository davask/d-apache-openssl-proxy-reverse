FROM davask/d-apache2
MAINTAINER davask <contact@davaskweblimited.com>

LABEL dwl.server.proxy="apache2"

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get install -y apache2-utils

RUN rm -rf /var/lib/apt/lists/*

RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_ajp
RUN a2enmod deflate
RUN a2enmod proxy_balancer
RUN a2enmod proxy_connect
RUN a2enmod proxy_html
RUN a2enmod xml2enc

# Copy instantiation specific file
COPY ./proxy-reverse.sh $DWL_INIT_DIR/$DWL_INIT_COUNT-proxy-reverse.sh
# update counter for next container
RUN DWL_INIT_COUNT=$(($DWL_INIT_COUNT+1))

