FROM fholzer/nginx-brotli

RUN rm -rf /usr/share/nginx/html/
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY  ./dist /var/www

CMD nginx -g 'daemon off;'

