FROM gitpod/workspace-full

USER gitpod

RUN sudo apt-get update && \
    sudo apt-get install -y \
        pkg-config \
        rust-lldb \
    && rustup component add rust-analysis rust-src rls clippy rustfmt \
    && sudo rm -rf /var/lib/apt/lists/*

ENV RUST_LLDB=/usr/bin/lldb-8

