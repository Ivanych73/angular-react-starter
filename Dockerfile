FROM nginx:1.21.6-alpine
RUN apk update
COPY nginx.conf /etc/nginx/nginx.conf
RUN touch /var/run/nginx.pid && \
  chown -R nginx:nginx /var/run/nginx.pid && \
  chown -R nginx:nginx /var/cache/nginx
EXPOSE 8080
USER nginx
VOLUME /var/www
COPY /angular/dist/angular-starter /var/www/html
ENTRYPOINT nginx