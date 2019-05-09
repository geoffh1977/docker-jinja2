# Build Docker Jinja Container
FROM geoffh1977/python3:latest
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

