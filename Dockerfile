FROM nginx

MAINTAINER nihaorz@qq.com

LABEL "启动时请使用-v参数挂载需要下载的文件目录到容器的/usr/share/nginx/html目录, 或待容器启动后使用docker cp拷贝文件到容器/usr/share/nginx/html目录下"

ARG NGINX_CONF=/etc/nginx/nginx.conf

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && echo "Asia/Shanghai" > /etc/timezone \
  && ln -s /usr/share/nginx/html /data \
  && sed -i 's/http {/http {\n\
    charset utf-8;\n\
    autoindex on;\n\
    autoindex_exact_size off;\n\
    autoindex_localtime on;/g' ${NGINX_CONF}
