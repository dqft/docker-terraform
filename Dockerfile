ARG DOCKER_PLATFORM=
FROM ${DOCKER_PLATFORM}alpine:latest

ARG TERRAFORM_VERSION=
ARG TERRAFORM_PLATFORM=

LABEL com.hashicorp.terraform.version ${TERRAFORM_VERSION}
LABEL com.hashicorp.terraform.platform ${TERRAFORM_PLATFORM}

RUN apk add --no-cache git openssh

ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_${TERRAFORM_PLATFORM}.zip /
RUN unzip /terraform_${TERRAFORM_VERSION}_${TERRAFORM_PLATFORM}.zip -d /bin/ \
  && rm /terraform_${TERRAFORM_VERSION}_${TERRAFORM_PLATFORM}.zip

ENTRYPOINT [ "/bin/terraform" ]