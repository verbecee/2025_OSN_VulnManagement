
ARG ALPINE_VERSION="3.20.4"
FROM alpine:$ALPINE_VERSION


# https://docs.renovatebot.com/modules/datasource/repology/

# renovate datasource=repology depName=alpine_3_20/curl versioning=loose
ENV CURL_VERSION=8.12.1-r0

# renovate datasource=repology depName=alpine_3_20/apache2 versioning=loose
ENV APACHE2_VERSION=2.4.62-r0

# renovate datasource=repology depName=alpine_3_20/python3 versioning=loose
ENV PYTHON3_VERSION=3.12.10-r1

# renovate datasource=repology depName=alpine_3_20/nginx versioning=loose
ENV NGINX_VERSION=1.26.3-r0

# renovate datasource=repology depName=alpine_3_20/openssl versioning=loose
ENV OPENSSL_VERSION=3.3.1-r0



# Install specific versions of curl, httpd, python3, nginx, openssl, and other necessary software
RUN apk add \
    # renovate:tag look here
    # curl-7.67.0-1.el8_2.2 \
    # httpd-2.4.37-30.module_el8.4.0+511+9c819073 \
    # python3-3.6.8-14.el8 \
    # nginx-1.14.1-9.el8 \
    # openssl-1.0.2k-19.el8_3.1 && \
    curl="${CURL_VERSION}" \
    apache2="${APACHE2_VERSION}" \
    python3="${PYTHON3_VERSION}" \
    nginx="${NGINX_VERSION}" \
    openssl="${OPENSSL_VERSION}" \


# Start the Apache and Nginx services when the container starts
CMD /bin/bash -c "systemctl start httpd && systemctl start nginx && tail -f /dev/null"
