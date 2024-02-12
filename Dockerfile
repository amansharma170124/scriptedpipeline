FROM centos:latest
MAINTAINER amansharma@gmail.com

# Temporarily disable the 'appstream' repository during the image build
RUN sed -i 's/enabled=1/enabled=0/' /etc/yum.repos.d/CentOS-AppStream.repo

RUN yum install -y httpd zip unzip

ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip /var/www/html/
WORKDIR /var/www/html

RUN unzip oxer.zip \
    && cp -rvf oxer/* . \
    && rm -rf oxer oxer.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
