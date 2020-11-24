FROM gitpod/workspace-full

USER gitpod

RUN sudo apt-get update && \
    sudo apt-get install -yq \
        pkg-config \
        libpython3.6 \
        rust-lldb \
    && sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/* /tmp/*

RUN .cargo/bin/rustup toolchain install nightly \
    && .cargo/bin/rustup default nightly \
    && .cargo/bin/rustup toolchain uninstall 1.48.0 \
    && .cargo/bin/rustup component add clippy llvm-tools-preview rls rust-analysis rust-src rustfmt \
    && .cargo/bin/rustup target add x86_64-unknown-linux-musl

RUN bash -lc "cargo install cargo-expand cargo-fmt cargo-cache cargo-make just"

ENV RUST_LLDB=/usr/bin/lldb-9
