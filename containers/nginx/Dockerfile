FROM nginx:1.15.8

RUN apt-get update && apt-get install -y vim

RUN rm -f /etx/nginx/conf.d/*

COPY nginx.conf /etc/nginx/conf.d/nginx.conf

CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/conf.d/nginx.conf
