FROM centos:centos8
MAINTAINER amansharma@gmail.com
RUN yum install -y httpd 
RUN yum install -y zip 
RUN yum install -y unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip   /var/www/html
WORKDIR /var/www/html
RUN unzip oxer.zip
RUN cp -rvf oxer/* .
RUN rm -rf oxer oxer.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
