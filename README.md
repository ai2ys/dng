# dng
ℹ️: This is a fork of [https://github.com/thorpelawrence/dng](https://github.com/thorpelawrence/dng) adding a dockerfile to the project. Thanks to [Lawrence Thorpe](hhttps://github.com/thorpelawrence).

```shell
docker docker compose build
docker compose run --rm dng-converter
```
If no other directory gets provided it will mount this workspace. Otherwise provide the directory like the following

```shell
docker docker compose build
DATA_DIR=<data directory to be mounted> docker compose run --rm dng-converter
```
Inside the container run `dng --help` for further information about the usage.

---

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
