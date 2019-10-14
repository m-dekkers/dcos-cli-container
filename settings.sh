#!/usr/bin/env bash

FROMIMAGE_VERSION="buster"
DOCKERTAG_VERSION="1.3"


## Base settings
printhdr "Image Builder Settings:"
FROMIMAGE="debian:${FROMIMAGE_VERSION}"; printmsg "Docker FROM" "${FROMIMAGE}"
DOCKERTAG="mesosphere/dcos-cli-container:${DOCKERTAG_VERSION}"; printmsg "Setting Tag"  "${DOCKERTAG}"
IMAGE_VERSION="${DOCKERTAG_VERSION}"; printmsg "Version" "${IMAGE_VERSION}"
ALWAYSPUSH="False"; printmsg "Always Push" "${ALWAYSPUSH}"

## Image specific settings
# printhdr "Image Settings:"

