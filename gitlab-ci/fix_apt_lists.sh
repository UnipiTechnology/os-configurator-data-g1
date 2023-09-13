#!/bin/bash

find files/etc/apt/ -name '*.list' -exec sed -i "s/##DEBIAN_VERSION##/${DEBIAN_VERSION}/g" {} \;
if [ "${DEBIAN_VERSION}" = "bookworm" ]; then
    sed -i "s/\bnon-free\b/non-free-firmware/g" files/etc/apt/sources.list.d/debian-nonfree.list || true
fi
