FROM alpine:3.15

LABEL org.opencontainers.image.authors="Manuel Quarneti <manuelquarneti@gmail.com>"

COPY scripts/ /scripts/

RUN \
    # Install packages
    apk add --no-cache openjdk17-jre-headless jq && \
    # remove apk
    rm -f /sbin/apk && \
    rm -rf /etc/apk && \
    rm -rf /lib/apk && \
    rm -rf /usr/share/apk && \
    rm -rf /var/lib/apk && \
    # set scripts as executable
    chmod +x /scripts/*

VOLUME ["/data"]
WORKDIR /data

EXPOSE 25565

ENV MEMORY=1G \
    TYPE=VANLLA \
    VERSION=LATEST

USER 1000:1000
ENTRYPOINT ["/scripts/start.sh"]
