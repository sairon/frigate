#!/bin/bash

set -euxo pipefail

hailo_version="4.20.1"

if [[ "${TARGETARCH}" == "amd64" ]]; then
    arch="x86_64"
elif [[ "${TARGETARCH}" == "arm64" ]]; then
    arch="aarch64"
fi

wget -qO- "https://github.com/sairon/frigate-hailort/releases/download/v${hailo_version}-deb11/hailort-${TARGETARCH}.tar.gz" |
    tar -C / -xzf -

mkdir -p /hailo-wheels

wget -P /hailo-wheels/ "https://github.com/sairon/frigate-hailort/releases/download/v${hailo_version}-deb11/hailort-${hailo_version}-cp39-cp39-linux_${arch}.whl"

