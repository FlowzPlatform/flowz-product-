FROM ubuntu:16.04

ARG domainkey
ARG gatewayid

# install dependencies
#RUN apt-get update \
#	&& apt-get install -y --no-install-recommends \
#		apache2 \
#	&& rm -r /var/lib/apt/lists/*

RUN apt-get update
RUN apt-get install -y apache2

RUN apt install -y software-properties-common
RUN LC_ALL=C.UTF-8  add-apt-repository -y ppa:ondrej/apache2
RUN apt update
RUN apt install -y  apache2



# Default command
CMD ["apachectl", "-D", "FOREGROUND"]

# Install Node.js
RUN apt-get update \
	&& apt-get install --yes curl
RUN curl --silent --location https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install --yes nodejs
RUN apt-get install --yes build-essential

#create directory html
RUN mkdir /var/www/html/dist
RUN mkdir -p /opt/app


# ssl certificate add
ADD cert /etc/ssl/cert
ADD privkey /etc/ssl/privkey


#working directory
WORKDIR /opt/app
ADD . /opt/app
RUN npm install

#build application
RUN npm run build
RUN cp -a -f /opt/app/bower_components /var/www/html/
RUN cp -a -f /opt/app/vids   /var/www/html/
RUN cp -a -f /opt/app/src/assets   /var/www/html/
RUN cp -a -f /opt/app/dist/* /var/www/html/
RUN cp /opt/app/.htaccess /var/www/html/
RUN cp /opt/app/vhost_ssl_master.conf /etc/apache2/sites-enabled/
RUN cp /opt/app/vhost_ssl_develop.conf /etc/apache2/sites-enabled/
RUN cp /opt/app/vhost_ssl_qa.conf /etc/apache2/sites-enabled/
RUN cp /opt/app/vhost_ssl_staging.conf /etc/apache2/sites-enabled/
RUN rm -rf /opt/app/*
RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2enmod http2
#RUN service apache2ctl restart
#RUN service apache2 startssl
RUN service apache2 restart


# Ports
EXPOSE 80
EXPOSE 443
