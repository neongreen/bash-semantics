FROM rust:1.75.0-alpine3.19

RUN apk add --no-cache musl-dev

RUN cargo install mdbook --version 0.4.36 \
  && cargo install mdbook-cmdrun --version 0.6.0

RUN apk add --no-cache bash

WORKDIR /book
ENTRYPOINT ["bash", "-c"]
