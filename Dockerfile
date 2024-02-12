FROM redhat/ubi8
MAINTAINER amansharma@gmail.com

# Install required packages
RUN yum install -y httpd zip unzip

# Download and extract web content
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip oxer.zip \
    && cp -rvf oxer/* . \
    && rm -rf oxer oxer.zip

# Configure CMD for Apache HTTP server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80
