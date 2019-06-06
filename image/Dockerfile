FROM osixia/light-baseimage
MAINTAINER Yannik Korzikowski <yannik@korzikowski.de>

ARG LAM_RELEASE=6.7

# update OS
RUN apt-get update \
&& apt-get upgrade -y

# install requirements
RUN /container/tool/add-multiple-process-stack \
    && /container/tool/add-service-available :ssl-tools \
    && LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    runit \
    nginx \
    apache2 \
    openssl \
    ldap-utils \
    php \
    php-fpm \
    php-ldap \
    php-zip \
    php-xml \
    php-curl \
    php-gd \
    php-imagick \
    php-mcrypt \
    php-tcpdf \
    php-phpseclib \
    fonts-dejavu \
    php-monolog

# install LAM
RUN wget http://prdownloads.sourceforge.net/lam/ldap-account-manager_${LAM_RELEASE}-1_all.deb?download -O /tmp/ldap-account-manager_${LAM_RELEASE}-1_all.deb \
&& dpkg -i /tmp/ldap-account-manager_${LAM_RELEASE}-1_all.deb

# cleanup
RUN apt-get autoremove -y && apt-get clean all \
 && rm -f /tmp/ldap-account-manager_${LAM_RELEASE}-1_all.deb 

# change permissions
RUN chown -R www-data:www-data /usr/share/ldap-account-manager

# Add service directory to /container/service
ADD service /container/service

RUN /container/tool/install-service

# Add default env variables
ADD environment /container/environment/99-default

# Expose default ldap, ldaps and ldapadmin ports
EXPOSE 389 636 8080

#VOLUME /usr/share/ldap-account-manager/config /lam_config
