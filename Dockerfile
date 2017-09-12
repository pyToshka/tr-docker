FROM php-fpm:latest
ENTRYPOINT service nginx start && service php7.0-fpm start && service syslog-ng restart && service sendmail restart &&  /bin/bash
RUN	sed -i 's/^#\(SYSLOGNG_OPTS="--no-caps"\)/\1/g' /etc/default/syslog-ng
EXPOSE 8080