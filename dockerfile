FROM archlinux:base-20230319.0.135218

# Enable Multilib repository
RUN echo "[multilib]" >> /etc/pacman.conf && \
    echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf

# Install necessary packages
RUN pacman -Sy --noconfirm && pacman -S --noconfirm \
        curl \
        openssl \
        gcc \
        make \
        perl \
        innoextract \
        wine \
        libunwind \
        xorg-server-xvfb \
    && pacman -Scc --noconfirm 

# https://superuser.com/a/948200/1058904
ENV DISPLAY=":0"
RUN Xvfb :0 -screen 0 1024x768x16 &

# Install Rust and dependencies
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

ARG ADOBE_DNG_CONVERTER=AdobeDNGConverter_x64_15_1_1.exe
RUN curl -L -o /${ADOBE_DNG_CONVERTER} https://download.adobe.com/pub/adobe/dng/win/${ADOBE_DNG_CONVERTER}

# Copy workspace code to the container
COPY . /app
RUN chmod u+x /app/PKGBUILD
WORKDIR /app
# Compile and install the DNG converter command
RUN . ./PKGBUILD && build && package

ENTRYPOINT [ "/bin/bash" ]