# syntax=docker/dockerfile:1

# BASE: Use the official stable image as our foundation
FROM ghcr.io/we-promise/sure:stable

# ENVIRONMENT: Set s6-overlay version
ARG S6_OVERLAY_VERSION=3.1.6.2

# INSTALL: S6 Overlay (The process supervisor)
# We need to install 'curl' and 'xz-utils' if they aren't in the base image (usually Debian/Alpine)
# The upstream image is likely Ruby-based (Debian).
USER root
RUN apt-get update && apt-get install -y curl xz-utils && \
    curl -L -o /tmp/s6-overlay-noarch.tar.xz https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz && \
    tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz && \
    curl -L -o /tmp/s6-overlay-x86_64.tar.xz https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz && \
    tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz && \
    rm -rf /tmp/* /var/lib/apt/lists/*

# SETUP: S6 Service Structures
# We create directories for our two services: 'web' (Rails) and 'worker' (Sidekiq)
RUN mkdir -p /etc/s6-overlay/s6-rc.d/web && \
    mkdir -p /etc/s6-overlay/s6-rc.d/worker && \
    echo "longrun" > /etc/s6-overlay/s6-rc.d/web/type && \
    echo "longrun" > /etc/s6-overlay/s6-rc.d/worker/type && \
    touch /etc/s6-overlay/s6-rc.d/user/contents.d/web && \
    touch /etc/s6-overlay/s6-rc.d/user/contents.d/worker

# COPY: Service Scripts (We will write these next)
COPY services/web /etc/s6-overlay/s6-rc.d/web/run
COPY services/worker /etc/s6-overlay/s6-rc.d/worker/run

# PERMISSIONS: Ensure scripts are executable
RUN chmod +x /etc/s6-overlay/s6-rc.d/web/run && \
    chmod +x /etc/s6-overlay/s6-rc.d/worker/run

# ENTRYPOINT: Hijack the startup flow to use S6
ENTRYPOINT ["/init"]
