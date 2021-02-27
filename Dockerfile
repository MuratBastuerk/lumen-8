FROM muratbastuerk/mb7-php-base:1.0

ARG WITH_XDEBUG=false

# Install lumen installer (depends on composer)
RUN if [ $WITH_XDEBUG = "false" ] ; then \
        rm -rf /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
    fi;

# Copy app to container
COPY service/ /var/www/html/

RUN mkdir -p /var/www/html/vendor \
    mkdir -p /var/www/html/storage
RUN chown -R www-data:www-data /var/www \
    && chmod -R 777 /var/www/html/storage \
    && chmod -R 755 /var/www/html/vendor

CMD ["sh", "-c", "/usr/bin/supervisord -n -c /etc/supervisord.conf"]
ENTRYPOINT [ "/docker-entrypoint.sh" ]