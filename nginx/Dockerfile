FROM nginx:1.13.5-alpine

LABEL maintainer="Forest Hoffman<forestjhoffman@gmail.com>"

##
# setting necessary server configurations
##

# add curl and other necessary packages for openssl and certbot
RUN apk add --update \
      curl \
      bash \
      openssl \
      certbot \
      python \
      py-pip \
    && pip install --upgrade pip

RUN addgroup staff \
    && addgroup www-data \
    && adduser -h /home/dev/ -D -g "" -G staff dev \
    && adduser -S -H -g "" -G www-data www-data \
    && echo dev:trolls | chpasswd

##
# copying nginx configuration file
##

COPY nginx.conf /etc/nginx/nginx.conf
RUN chown root:staff /etc/nginx/nginx.conf

# copies over the startup file which handles initializing the nginx
# server and the SSL certification process (if necessary)
COPY startup.sh /bin/startup.sh
RUN chown root:root /bin/startup.sh \
    && chmod ug+rx /bin/startup.sh \
    && chmod go-w /bin/startup.sh