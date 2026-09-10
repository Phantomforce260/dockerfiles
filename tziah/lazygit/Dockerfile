FROM alpine:3.20

RUN apk add --no-cache git openssh-client curl bash ncurses

# Pin a version with --build-arg LAZYGIT_VERSION=0.65.0 if you want reproducible builds.
# Left empty by default, which resolves to whatever is latest at build time.
ARG LAZYGIT_VERSION=""

RUN set -eux; \
    if [ -z "$LAZYGIT_VERSION" ]; then \
      LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" \
        | grep -o '"tag_name": "v[^"]*"' | cut -d'"' -f4 | sed 's/^v//'); \
    fi; \
    curl -Lo /tmp/lazygit.tar.gz \
      "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_linux_x86_64.tar.gz"; \
    tar -xzf /tmp/lazygit.tar.gz -C /tmp lazygit; \
    install -m 755 /tmp/lazygit /usr/local/bin/lazygit; \
    rm -f /tmp/lazygit /tmp/lazygit.tar.gz

WORKDIR /repo

# Host files are owned by the host user, but the container runs as root, which OpenSSH rejects. Copy them
# into a fresh /root/.ssh owned by root with correct permissions at runtime.
ENTRYPOINT ["sh", "-c", "if [ -d /ssh ]; then rm -rf /root/.ssh; mkdir -p /root/.ssh; cp -r /ssh/. /root/.ssh/; chown -R root:root /root/.ssh; find /root/.ssh -type f -exec chmod 600 {} +; find /root/.ssh -type d -exec chmod 700 {} +; fi; exec lazygit \"$@\"", "lazygit"]
