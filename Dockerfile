FROM php:5.6-apache
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock
ENV APACHE_PID_FILE /var/run/apache2.pid
EXPOSE 8080
WORKDIR /var/www/html/
COPY . /var/www/html
RUN sed -i 's/80/8080/g' /etc/apache2/ports.conf
RUN sed -i 's/:80/:8080/g' /etc/apache2/sites-available/000-default.conf
RUN ln -s /var/www/html /var/www/html/speedtest
RUN chgrp -R 0 /var/www/html
RUN chmod -R g+rwx /var/www/html
RUN chgrp -R 0 /var/log/apache2
RUN chmod -R g+rwX /var/log/apache2
RUN chmod g+rwx /var/run
CMD ["/usr/local/bin/apache2-foreground"]
