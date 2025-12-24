# Setup de desenvolvimento

Para desenvolver localmente e executar os checks, instale o toolchain Rust (via `rustup`) e os componentes necessários:

1. Instalar Rust (rustup):

   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

2. Usar o `rust-toolchain.toml` do repositório para garantir o mesmo canal:

   rustup show

3. Instalar componentes necessários:

   rustup component add rustfmt clippy

4. Comandos úteis:

   - Formatar: `cargo fmt --all`
   - Rodar clippy: `cargo clippy --all-targets --all-features -- -D warnings`
   - Build: `cargo build --release`
   - Testes: `cargo test`

Observação: o workflow de CI (GitHub Actions) já executa as verificações automaticamente em pushes e PRs.