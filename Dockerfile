
ARG ALPINE_VERSION="3.22.0"
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
ENV OPENSSL_VERSION=3.3.3-r0

# Install specific versions of curl, httpd, python3, nginx, openssl, and other necessary software
RUN apk add \
    curl="${CURL_VERSION}" \
    apache2="${APACHE2_VERSION}" \
    python3="${PYTHON3_VERSION}" \
    nginx="${NGINX_VERSION}" \
    openssl="${OPENSSL_VERSION}"

