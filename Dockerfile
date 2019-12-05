FROM nginx

MAINTAINER nihaorz@qq.com

ARG NGINX_CONF=/etc/nginx/nginx.conf

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && echo "Asia/Shanghai" > /etc/timezone \
  && rm -rf /usr/share/nginx/html \
  && ln -s /data /usr/share/nginx/html \
  && sed -i 's/http {/http {\n\
    charset utf-8;\n\
    autoindex on;\n\
    autoindex_exact_size off;\n\
    autoindex_localtime on;/g' ${NGINX_CONF}
