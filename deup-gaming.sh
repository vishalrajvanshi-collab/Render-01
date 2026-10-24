#!/bin/bash

# 1. Dynamically find the current working directory instead of forcing /root
TARGET_DIR="./my_journey"
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR" || exit 1

# 2. Look for gotty locally first, then look globally
if [ -f "./gotty" ]; then
    GOTTY_CMD="./gotty"
elif command -v gotty &> /dev/null; then
    GOTTY_CMD="gotty"
else
    echo "Downloading a portable version of GoTTY for this environment..."
    wget -qO- https://github.com | tar xz
    chmod +x gotty
    GOTTY_CMD="./gotty"
fi

# 3. Launch using the validated path and port variable
echo "Launching GoTTY on port ${SERVER_PORT:-8080}..."
$GOTTY_CMD -w -p "${SERVER_PORT:-8080}" bash
