FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
# Railway injecte dynamiquement la variable $PORT. Ce script remplace le port 80 par celui de Railway au démarrage.
CMD ["/bin/sh", "-c", "sed -i 's/listen  80;/listen '\"$PORT\"';/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
