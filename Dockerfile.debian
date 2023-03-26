FROM rust:1-slim-bullseye AS build

RUN echo "deb [trusted=yes] http://download.opensuse.org/repositories/home:dscharrer/Debian_11/ /" >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
        curl \
        git \
        innoextract \
        make \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workdir

ARG ADOBE_DNG_CONVERTER=AdobeDNGConverter_x64_15_1_1.exe
RUN curl -O https://download.adobe.com/pub/adobe/dng/win/${ADOBE_DNG_CONVERTER}

COPY . .

RUN make && make DESTDIR="${PWD}/pkg" install

FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
        wget \
        xvfb \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -pm755 /etc/apt/keyrings && \
    wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key && \
    wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bullseye/winehq-bullseye.sources

RUN dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install -y --install-recommends \
        winehq-stable \
    && rm -rf /var/lib/apt/lists/*

COPY --from=build /workdir/pkg /
    
ENTRYPOINT [ "dng" ]
