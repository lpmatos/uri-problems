# =============================================================================
# BASE CONFIGURATION
# =============================================================================

ARG GO_VERSION=alpine3.10
ARG ALPINE_VERSION=3.10

# =============================================================================
# BUILD ENV
# =============================================================================

FROM golang:${GO_VERSION} AS build-env

WORKDIR /usr/src/app/

COPY [ "./code", "." ]

RUN build -o code

# =============================================================================
# BASE ENV
# =============================================================================

FROM alpine:${ALPINE_VERSION}

LABEL maintainer="Lucca Pessoa da Silva Matos - luccapsm@gmail.com"

WORKDIR /usr/src/app/

COPY --from=build-env [ "/usr/src/app", "." ]

ENTRYPOINT []

CMD [ "sh" ]
