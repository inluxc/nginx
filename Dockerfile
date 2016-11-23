#
# Nginx Dockerfile
#
# https://github.com/dockerfile/nginx
#

# Pull base image.
FROM ubuntu:16.04

# Install Nginx.
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx && \
  apt-get install php7.0-cli php7.0-curl php7.0-dev php7.0-zip php7.0-fpm php7.0-gd php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-mbstring php7.0-opcache php7.0-iconv php7.0-DOM php7.0-soap php7.0-pdo-mysql -y

# Define mountable directories.
VOLUME ["/var/factions/containers/www/config:/etc/nginx/sites-enabled", "/var/factions/containers/www/certs:/etc/nginx/certs", "/etc/nginx/conf.d", "/var/factions/containers/www/log:/var/log/nginx", /var/factions/containers/www/htdocs:/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
