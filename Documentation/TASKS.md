# Tarefas & Roadmap

## Infraestrutura do Repositório
- [ ] `CHANGELOG.md`
- [ ] Configurar Rustfmt
- [ ] Configurar Clippy
- [X] Lints no CI
- [ ] Pipeline de build (Linux, Windows, macOS)
- [ ] Testes no CI
- [ ] Pipeline de documentação
- [X] Lints de documentação (Prettier + markdownlint)
- [X] Auto-format workflow (auto-format.yml)- [ ] ISSUE templates, PR template, CODEOWNERS
- [ ] Dependabot (dependabot.yml)
- [X] Commitlint (conventional commits check)
- [ ] Husky commit-msg local hook (optional)
- [X] release-please (automated release PRs / changelog)- [ ] Release workflow (publish crate / create release)

## Engine Core
- [ ] Módulo `engine-core`
- [ ] Game loop
- [ ] Sistema de logging
- [ ] EngineConfig
- [ ] Gerenciamento de tempo (delta, fps)

## Sistema ECS
- [ ] Escolher ECS (bevy_ecs / hecs / specs / custom)
- [ ] Sistema de entidades
- [ ] Sistema de componentes
- [ ] Sistema de sistemas
- [ ] World manager
- [ ] ECS exposto ao Lua

## Integração com Lua
- [ ] Módulo `engine-scripting`
- [ ] Integrar Lua VM (`mlua`)
- [ ] Wrapper seguro
- [ ] Carregar `.lua`
- [ ] Funções básicas (print, log)
- [ ] API de input
- [ ] API de tempo
- [ ] Callbacks (`on_start`, `on_update`, `on_exit`)

## Renderização (wgpu)
- [ ] Módulo de render
- [ ] Janela com `winit`
- [ ] Inicializar wgpu
- [ ] Pipeline minimal (clear screen)
- [ ] Renderer 2D
- [ ] Sprite renderer
- [ ] Text renderer
- [ ] Câmera 2D
- [ ] API Lua: `draw_sprite`

## Sistema de Input
- [ ] Integrar `winit`
- [ ] API Rust de input
- [ ] API Lua (`is_key_down`, `is_key_pressed`)

## Áudio
- [ ] Integrar `rodio` ou `kira`
- [ ] Player básico
- [ ] API Lua (`play_sound`)

## Assets
- [ ] Asset loader
- [ ] Cache de texturas
- [ ] Carregar scripts
- [ ] Carregar imagens, sons, fontes
- [ ] Hot reload (opcional)

## Ferramentas de Build
- [ ] CLI da engine (`engine-cli`)
- [ ] Gerador de projetos (`engine new`)
- [ ] Empacotador de assets
- [ ] Sistema automático de versão
- [ ] Bindings Lua automáticos (opcional)

## Testes
- [ ] Testes unitários
- [ ] Testes de integração (Rust ↔ Lua)
- [ ] Testes de performance
- [ ] Testes da API Lua

## Documentação
- [ ] `cargo doc`
- [ ] Documentação da API Lua
- [ ] Tutorial: “Seu Primeiro Jogo”
- [ ] Exemplos práticos (Pong, plataforma simples)
- [ ] Pipeline de documentação (publicar docs no GitHub Pages; validar deploy)
- [ ] Tornar dependências pesadas opcionais (features) — feito, validar builds
- [ ] Criar job de quality/scan (cargo-audit, autoformat) — criado (code-quality.yml)
## Releases
- [ ] Versão 0.1
- [X] Changelog automático (workflow criado)
- [X] Auto-release (detect version bump -> create tag/release)
- [ ] Empacotamento da engine
- [X] Página no GitHub Pages (workflow criado; validação pendente)
