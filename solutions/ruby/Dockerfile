ARG RUBY_VERSION=2.6.5-alpine3.10

FROM ruby:${RUBY_VERSION}

LABEL maintainer="Lucca Pessoa da Silva Matos - luccapsm@gmail.com" \
        org.label-schema.version="1.0.0" \
        org.label-schema.release-data="21-06-2020" \
        org.label-schema.url="https://github.com/lpmatos" \
        org.label-schema.alpine="https://alpinelinux.org/" \
        org.label-schema.name="Ruby Uri Solutions"

WORKDIR /usr/src/app/

COPY [ "./code", "." ]
