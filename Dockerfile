FROM centos:latest
MAINTAINER amansharma@gmail.com

RUN yum install -y --exclude=centos-release-appstream httpd zip unzip

ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip /var/www/html/
WORKDIR /var/www/html

RUN unzip oxer.zip \
    && cp -rvf oxer/* . \
    && rm -rf oxer oxer.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
