FROM nginx

ARG NGINX_CONF=/etc/nginx/nginx.conf

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && echo "Asia/Shanghai" > /etc/timezone \
  && sed -i 's/http {/http {\n\
    charset utf-8;\n\
    autoindex on;\n\
    autoindex_exact_size off;\n\
    autoindex_localtime on;/g' ${NGINX_CONF}
