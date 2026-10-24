#!/bin/bash
cd /root/my_journey

exec /usr/local/bin/gotty \
    --port "${PORT:-8080}" \
    --index /index.html \
    --permit-write \
    --reconnect \
    /bin/bash


# Line 31 (GoTTY Download) should look like this:
wget -qO- https://github.com | tar xz

# Line 43 (HealthLog Clone) should look like this:
git clone "https://github.com" "healthlog-src"
