FROM ubuntu:12.04

MAINTAINER Lohan Bodevan <lohan.bodevan@gmail.com>

# Update
RUN apt-get update

# Install Apache
RUN apt-get install -y apache2

# Install php
RUN apt-get install -y php5 libapache2-mod-php5 php5-mcrypt

# Install phppgadmin
RUN apt-get install -y phppgadmin
RUN sed -i "s/# allow from all/allow from all/g" /etc/apache2/conf.d/phppgadmin
RUN sed -i "s/\$conf\['extra_login_security'\] = true;/\$conf\['extra_login_security'\] = false;/g" /etc/phppgadmin/config.inc.php
RUN sed -i "s/\$conf\['servers'\]\[0\]\['host'\] = 'localhost';/\$conf\['servers'\]\[0\]\['host'\] = 'postgres';/g" /etc/phppgadmin/config.inc.php

EXPOSE 8889

CMD service apache2 start; \
    tail -f /var/log/apache2/*.log
