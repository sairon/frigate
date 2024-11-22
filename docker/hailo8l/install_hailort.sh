#!/bin/bash

set -euxo pipefail

hailo_version="4.19.0"
release_repo="https://github.com/frigate-nvr/hailort"

if [[ "${TARGETARCH}" == "amd64" ]]; then
    arch="x86_64"
elif [[ "${TARGETARCH}" == "arm64" ]]; then
    arch="aarch64"
    hailo_version="4.18.0"
    release_repo="https://github.com/sairon/hailort"
fi

wget -qO- "${release_repo}/releases/download/v${hailo_version}/hailort-${TARGETARCH}.tar.gz" |
    tar -C / -xzf -

mkdir -p /hailo-wheels

wget -P /hailo-wheels/ "${release_repo}/releases/download/v${hailo_version}/hailort-${hailo_version}-cp39-cp39-linux_${arch}.whl"

