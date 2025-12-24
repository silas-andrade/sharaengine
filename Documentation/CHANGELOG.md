# Changelog

Todas as mudanças relevantes no projeto serão listadas aqui.

## [Unreleased]

> Entradas do changelog são atualizadas automaticamente a partir das mensagens de
commit (via workflow `Update Changelog`).

- Estrutura inicial de documentação movida para `Documentation/`.
- Arquivos de suporte adicionados: `CONTRIBUTING`, `CODE_OF_CONDUCT`,
  `SETUP.md`, `TUTORIAL.md`.
- `rust-toolchain.toml`, `rustfmt.toml`, `clippy.toml` e `.editorconfig` adicionados.
- Workflow de CI (`.github/workflows/ci.yml`) criado (format, clippy, build,
  test); agora integra Prettier + markdownlint para docs.
- Workflow `gh-pages.yml` adicionado para publicar `Documentation/` e `cargo doc`
  no GitHub Pages.
- Workflow `release.yml` adicionado para detectar bumps de versão e publicar
  release + docs.
- Módulos/stubs adicionados: `src/engine_core.rs`, `src/engine_scripting.rs` e
  `examples/simple.rs`.

(Entradas futuras serão agregadas automaticamente.)
