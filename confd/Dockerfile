FROM nginx
#Install confd and create directories
RUN apt-get update -y \
    && apt-get install wget -y \
    && wget https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 \
    && mkdir -p /opt/confd/bin \
    && mv confd-0.16.0-linux-amd64 /opt/confd/bin/confd \
    && chmod +x /opt/confd/bin/confd \
    && export PATH="$PATH:/opt/confd/bin" \
    && mkdir -p /etc/confd/conf.d \
    && mkdir -p /etc/confd/templates \
    && mkdir -p /etc/nginx/sites-enabled

#ADD confd files and templates
ADD confd.toml /etc/confd/confd.toml 
ADD conf.d/* /etc/confd/conf.d/
ADD templates/* /etc/confd/templates/
ADD nginx.conf /etc/nginx/nginx.conf

CMD ["/usr/sbin/nginx","-g","daemon off;"]
