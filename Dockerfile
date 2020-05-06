#gzip
FROM nginx:stable

#brotli
# FROM fholzer/nginx-brotli

COPY  ./dist /var/www
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
CMD nginx -g 'daemon off;'

