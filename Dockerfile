FROM nginx:1.21.6-alpine
RUN apk update
COPY nginx.conf /etc/nginx/nginx.conf
RUN touch /var/run/nginx.pid && \
  chown -R nginx:nginx /var/run/nginx.pid && \
  chown -R nginx:nginx /var/cache/nginx
USER nginx
VOLUME /var/www
ENTRYPOINT nginx -g "daemon off;"