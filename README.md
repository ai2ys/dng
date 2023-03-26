# dng

Wrapper around Adobe DNG Converter to use with *nix via wine

## Prerequisites

1. rust
2. wine
3. innoextract
4. make

## Installation

[![Packaging status](https://repology.org/badge/vertical-allrepos/dng.svg)](https://repology.org/project/dng/versions)

```shell
make
make install
```

## References

- https://rawpedia.rawtherapee.com/How_to_convert_raw_formats_to_DNG
- https://web.archive.org/web/20220412005456/https://helpx.adobe.com/content/dam/help/en/photoshop/pdf/dng_commandline.pdf


## Building the 🐳 Docker images

Choose between lightweight ⛰️ Alpine or Debian distribution.

Example when using Docker Compose plugin.
```bash
DISTRO=<debian or alpine> docker compose build
# mounting DATA_DIR, if empty it will default to this workspace
DATA_DIR=<image directory> docker compose run --rm -T dng-converter -o output.dng <input raw>
```