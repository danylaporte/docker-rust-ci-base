FROM alpine

COPY . /docker-rust-ci-base
WORKDIR  /docker-rust-ci-base

RUN apk add --no-cache gcc \
    build-base \
    clang \
    clang-dev \
    clang-libs \
    cmake \
    linux-headers \
    llvm-dev \
    musl-dev \
    openssl-dev \
    rust \
    cargo

RUN cargo build --release
