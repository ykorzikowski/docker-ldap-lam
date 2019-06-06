FROM debian:stretch
MAINTAINER Yannik Korzikowski <yannik@korzikowski.de>

ARG LAM_RELEASE=6.7

# update OS
RUN apt-get update \
&& apt-get upgrade -y

# install requirements
RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    nginx \
    apache2 \
    openssl \
    slapd \
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
 && rm -f /tmp/ldap-account-manager_${LAM_RELEASE}-1_all.deb \

RUN echo $'server {\n\
    listen *:8080;\n\
    listen [::]:8080;\n\
    server_name _;\n\

    location / {\n\
        index index.html;\n\
        alias /usr/share/ldap-account-manager;\n\
        autoindex off;\n\

        location ~ \.php$ {\n\
                include snippets/fastcgi-php.conf;\n\
                fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;\n\
                fastcgi_param SCRIPT_FILENAME $request_filename;\n\
        }\n\

        location ~ /lam/(tmp/internal|sess|config|lib|help|locale) {\n\
                deny all;\n\
                return 403;\n\
        }\n\

    }\n\
}' > /etc/nginx/sites-available/default


# Add service directory to /container/service
ADD service /container/service

# Add default env variables
ADD environment /container/environment/99-default

# Expose default ldap, ldaps and ldapadmin ports
EXPOSE 389 636 8080

VOLUME /etc/ldap/slapd.d /slapd_data
VOLUME /usr/share/ldap-account-manager/config /lam_config
