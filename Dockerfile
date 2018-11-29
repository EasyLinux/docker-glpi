FROM alpine:3.8
LABEL author="Serge NOEL <serge.noel@net6a.com" \
      description="Gestion Libre de Parc Informatique" \
      version="9.3.3"

#Installation d'apache2 et de php7 avec les extensions nécessaires
RUN apk update \
    && apt add --no-cache \
           php7-apache \
           php7-mysqli \
           php7-ldap \
           php7-xmlrpc \
           php7-imap \
           curl \
           php7-curl \
           php7-gd \
           php7-mbstring \
           php7-xml \
           php7-apcu \
           php7-cas \
           jq \
    && mkdir /var/run/apache2

#Copie et execution du script pour l'installation et l'initialisation de GLPI
COPY launch-glpi /usr/local/bin/
RUN chmod +x /usr/local/bin/launch-glpi
CMD ["/usr/local/bin/launch-glpi"]

#Exposition des ports
EXPOSE 80

VOLUME /var/www/html/files


