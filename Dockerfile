# Use Red Hat Universal Base Image 8
FROM registry.access.redhat.com/ubi8/ubi:latest

# Set the maintainer label
LABEL maintainer="your-email@example.com"

# Install specific versions of curl, httpd, python3, nginx, openssl, and other necessary software
RUN yum update -y && \
    yum install -y \
    curl-7.67.0-1.el8_2.2 \
    httpd-2.4.37-30.module_el8.4.0+511+9c819073 \
    python3-3.6.8-14.el8 \
    nginx-1.14.1-9.el8 \
    openssl-1.0.2k-19.el8_3.1 && \
    yum clean all

# Expose ports for both HTTP (80) and Nginx (80)
EXPOSE 80  # For Apache HTTP
EXPOSE 8080 # For Nginx

# Start the Apache and Nginx services when the container starts
CMD /bin/bash -c "systemctl start httpd && systemctl start nginx && tail -f /dev/null"
