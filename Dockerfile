# run nginx static server on container start
FROM nginx:stable
COPY --from=build /myapp/dist/ /var/www
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
CMD nginx -g 'daemon off;'
