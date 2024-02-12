FROM centos:latest
MAINTAINER amansharma@gmail.com
RUN   yum install -y httpd \
      zip  \
     unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page258/louxry.zip   /var/www/html
WORKDIR /var/www/html
RUN  unzip louxry.zip
RUN cp -rvf louxry/* .
RUN rm -rf louxry louxry.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
