#!/usr/bin/env bash

FROMIMAGE_VERSION="buster"
DOCKERTAG_VERSION="-1.0"


## Base settings
printhdr "Image Builder Settings:"
FROMIMAGE="i386/debian:${FROMIMAGE_VERSION}"; printmsg "Docker FROM" "${FROMIMAGE}"
DOCKERTAG="d2iqmdekkers/dcos-cli-container:386${DOCKERTAG_VERSION}"; printmsg "Setting Tag"  "${DOCKERTAG}"
IMAGE_VERSION="${DOCKERTAG_VERSION}"; printmsg "Version" "${IMAGE_VERSION}"
ALWAYSPUSH="False"; printmsg "Always Push" "${ALWAYSPUSH}"

## Image specific settings
# printhdr "Image Settings:"

