# Shara Engine

**Shara Engine** é um motor de jogos 2D em desenvolvimento, escrito em Rust com
integração a Lua para scripting.

> A documentação completa está em `Documentation/`.

- Visão geral: `Documentation/Overview.md`
- Tarefas & roadmap: `Documentation/TASKS.md`
- Como contribuir: `Documentation/CONTRIBUTING.md`
- Changelog: `Documentation/CHANGELOG.md`

## Status

- CI: ![CI](https://github.com/silas-andrade/sharaengine/actions/workflows/ci.yml/badge.svg)
  (formatação, clippy, build, teste)
- Docs: ![Pages](https://github.com/silas-andrade/sharaengine/actions/workflows/gh-pages.yml/badge.svg)
  — https://silas-andrade.github.io/sharaengine/ (deploy automático)
- Formatação/Lints: `rustfmt`, `clippy` e docs com Prettier + markdownlint
  (veja `Documentation/SETUP.md` para instruções locais)

Observação:
- Recursos nativos pesados (render, audio, scripting) são opcionais e desativados por padrão.
  Use `--all-features` quando desejar compilar com todas as features (isso pode requerer bibliotecas do sistema).

---

## Licença

Este projeto está licenciado sob a **MIT License** — veja `LICENSE`.

---

Se quiser ajudar, abra uma issue ou envie um PR. Obrigado! :rocket:


