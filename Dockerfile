ARG BASE_IMAGE_TAG="debian-11"
ARG APP_ICON="https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Signal_ultramarine_icon.svg/600px-Signal_ultramarine_icon.svg.png"

FROM jlesage/baseimage-gui:${BASE_IMAGE_TAG}
ENV APP_NAME="Signal Messenger" \
    DARK_MODE="1" \
    LANG="en-EN.UTF-8"

RUN : \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -yq update \
    && apt-get -yq --no-install-recommends install \
        wget \
        gpg \
        libgbm1 \
        procps \
    && wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg \
    && cat signal-desktop-keyring.gpg \
        | tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null \
    && echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' \
        | tee /etc/apt/sources.list.d/signal-xenial.list \
    && apt-get -yq update \
    && apt-get -yq --no-install-recommends install signal-desktop \
    && apt-get -yq purge wget gpg \
    && apt-get -yq autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN : \
    && chown root:root /opt/Signal/chrome-sandbox \
    && chmod 755 /opt/Signal/chrome-sandbox 

ARG APP_ICON
RUN install_app_icon.sh ${APP_ICON}

COPY ./startapp.sh /startapp.sh

VOLUME ["/config"]
