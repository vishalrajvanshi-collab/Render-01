FROM ubuntu:22.04

ENV GOTTY_TAG_VER=v1.0.1
ENV PORT=8080

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl \
    && curl -fsSL "https://github.com/yudai/gotty/releases/download/${GOTTY_TAG_VER}/gotty_linux_amd64.tar.gz" \
       -o /tmp/gotty.tar.gz \
    && tar -xzf /tmp/gotty.tar.gz -C /usr/local/bin \
    && chmod 755 /usr/local/bin/gotty \
    && rm -f /tmp/gotty.tar.gz \
    && apt-get purge -y --auto-remove curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY deup-gaming.sh /deup-gaming.sh
COPY index.html /index.html
COPY workspace/ /root/my_journey/

RUN chmod 755 /deup-gaming.sh

EXPOSE 8080

CMD ["/bin/bash", "/deup-gaming.sh"]
