ARG GO_VERSION=alpine3.10
ARG ALPINE_VERSION=3.10

FROM golang:${GO_VERSION} AS build-env

WORKDIR /usr/src/app/

COPY [ "./code", "." ]

RUN build -o code

FROM alpine:${ALPINE_VERSION}

LABEL maintainer="Lucca Pessoa da Silva Matos - luccapsm@gmail.com" \
        org.label-schema.version="1.0.0" \
        org.label-schema.release-data="21-06-2020" \
        org.label-schema.url="https://github.com/lpmatos" \
        org.label-schema.alpine="https://alpinelinux.org/" \
        org.label-schema.name="GoLang Uri Solutions"

WORKDIR /usr/src/app/

COPY --from=build-env [ "/usr/src/app", "." ]
