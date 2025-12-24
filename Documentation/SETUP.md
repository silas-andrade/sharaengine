# Setup de desenvolvimento

Para desenvolver localmente e executar os checks, instale o toolchain Rust (via `rustup`) e os componentes necessários:

1. Instalar Rust (rustup):

   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

2. Usar o `rust-toolchain.toml` do repositório para garantir o mesmo canal:

   rustup show

3. Instalar componentes necessários:

   rustup component add rustfmt clippy

4. Ferramentas JS (documentação e lint de arquivos Markdown):

   - Instalar Node.js (LTS): https://nodejs.org/
   - Instalar dependências JS do repositório (recomendado gerar e commitar `package-lock.json` para builds reprodutíveis):

     ```bash
     if [ -f package-lock.json ]; then
       npm ci
     else
       npm install
       # Opcional: adicione e commite o package-lock.json para travar versões
       # git add package-lock.json && git commit -m "chore(deps): add package-lock.json"
     fi
     ```

5. Comandos úteis:

   - Formatar (Rust): `cargo fmt --all`
   - Rodar clippy: `cargo clippy --all-targets --all-features -- -D warnings`
   - Build (sem features pesadas): `cargo build --no-default-features`
   - Testes (sem features pesadas): `cargo test --no-default-features`
   - Build com todas as features (requer deps do sistema): `cargo build --all-features`
   - Formatar docs com Prettier: `npm run format`
   - Verificar formatação: `npm run format:check`
   - Lint Markdown: `npm run lint:md`

   Observação: para gerar a documentação localmente sem precisar de
   dependências nativas, execute: `cargo doc --no-default-features`.
   Se precisar construir com `--all-features`, instale as dependências do sistema
   necessárias (ex.: `libasound2-dev`, `pkg-config` no Ubuntu).

6. Formatação automática via CI

   O repositório possui um workflow (`.github/workflows/auto-format.yml`) que executa Prettier e `cargo fmt` automaticamente. Se forem encontradas mudanças, o workflow tentará comitar e dar push para a branch atual; se não conseguir (ex.: PR vindo de fork) ele criará um PR `auto/format-fixes` com as correções.

7. Releases automáticas

   O repositório possui um workflow (`.github/workflows/release.yml`) que detecta alterações na versão (`Cargo.toml` ou `package.json`) comparando com `origin/main`. Quando detectada uma mudança de versão ele:

   - Atualiza o `Documentation/CHANGELOG.md` promovendo as entradas de `Unreleased` para a nova versão (via `.github/scripts/release_changelog.sh`).
   - Cria uma tag `vX.Y.Z` e um GitHub Release com as notas extraídas do changelog.
   - Publica a documentação (`cargo doc` + `Documentation/`) no GitHub Pages.
   - Opcional: se o secret `CRATES_IO_TOKEN` estiver definido, tentará publicar o crate (`cargo publish`).

   Requisitos/Secrets:
   - `GITHUB_TOKEN` (fornecido automaticamente para workflows)
   - `CRATES_IO_TOKEN` (opcional) — adicione em `Settings > Secrets` caso queira publicação automática no crates.io

Observação: o workflow de CI (GitHub Actions) já executa as verificações automaticamente em pushes e PRs.