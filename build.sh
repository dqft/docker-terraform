#!/bin/sh

TERRAFORM_VERSION=1.1.2
TERRAFORM_PLATFORM=linux_arm64
TERRAFORM_DOCKER_IMAGE=hashicorp/terraform:${TERRAFORM_VERSION}

_docker_platform() {
  case "$(docker system info --format '{{ .Architecture }}')" in
    armhf) echo "arm32v6";;
    armv7) echo "arm32v7";;
    aarch64) echo "arm64v8";;
    ppc64le) echo "ppc64le";;
    riscv64) echo "riscv64";;
    s390x) echo "s390x";;
    x86) echo "i386";;
    x86_64) echo "amd64";;
    *) echo "unknown";;
  esac
}

docker build \
  --pull \
  -t ${TERRAFORM_DOCKER_IMAGE} \
  --build-arg DOCKER_PLATFORM=$(_docker_platform)/ \
  --build-arg TERRAFORM_PLATFORM=${TERRAFORM_PLATFORM} \
  --build-arg TERRAFORM_VERSION=${TERRAFORM_VERSION} \
  .