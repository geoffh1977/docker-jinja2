# Build Docker Jinja Container
ARG IMAGE_USER=geoffh1977
ARG IMAGE_NAME=python3
ARG IMAGE_VERSION=latest

FROM ${IMAGE_USER}/${IMAGE_NAME}:${IMAGE_VERSION}
LABEL maintainer="geoffh1977 <geoffh1977@gmail.com>"
USER root

# Install Docker Jinja
# hadolint ignore=DL3013,DL3018
RUN pip3 install --upgrade --no-cache-dir j2cli[yaml] && \
    mkdir /project && \
    chown "${ALPINE_USER}":"${ALPINE_USER}" /project

VOLUME ["/project"]
WORKDIR /project
USER ${ALPINE_USER}
CMD ["j2"]

