FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    libssl-dev \
    curl https://sh.rustup.rs -sSf | sh -s -- -y --profile minimal --default-toolchain 1.45.2

ENV PATH="/root/.cargo/bin:${PATH}"
COPY . /docker-rust-ci-base
WORKDIR  /docker-rust-ci-base

RUN cargo build --release
