<h1 align="center">🚀 Shara Engine</h1>

<p align="center"><strong>Shara Engine — Um motor de jogos 2D moderno escrito em Rust</strong></p>

<p align="center">
  Shara Engine é uma game engine 2D em desenvolvimento, focada em desempenho,
  modularidade e integração com Lua para criação rápida de jogos.
</p>

---

## 📖 Índice

- [Visão Geral](#-visão-geral)
- [Tarefas](#-tarefas)
- [Licença](#-licença)

---

## 🔭 Visão Geral

O objetivo deste projeto é desenvolver uma game engine moderna em **Rust**, com **Lua** como linguagem de script integrada.

Além de funcionar como plataforma experimental para sistemas de jogos, o projeto também compõe um case profissional do meu portfólio, demonstrando experiência com:

- Arquitetura de motores de jogo  
- Integração e segurança de linguagens de script  
- Sistemas de renderização e abstrações gráficas  
- Programação de baixo nível com Rust  
- Organização, modularidade e engenharia de software  
- Construção de ferramentas e pipelines  
- Design de APIs limpas, previsíveis e extensíveis  

---

## 💻 Tarefas

### 🏗️ Infraestrutura do Repositório
- [X] Estrutura inicial  
- [X] `README.md`  
<!--
- [ ] `CONTRIBUTING.md`  
- [ ] `CODE_OF_CONDUCT.md`  
- [X] Definição de licença  
-->
- [ ] `CHANGELOG.md`  
- [ ] Configurar Rustfmt  
- [ ] Configurar Clippy  
- [X] Lints no CI  
- [ ] Pipeline de build (Linux, Windows, macOS)  
- [ ] Testes no CI  
- [ ] Pipeline de documentação  

---

### ⚙️ Engine Core
- [ ] Módulo `engine-core`  
- [ ] Game loop  
- [ ] Sistema de logging  
- [ ] EngineConfig  
- [ ] Gerenciamento de tempo (delta, fps)  

---

### 🧩 Sistema ECS
- [ ] Escolher ECS (bevy_ecs / hecs / specs / custom)  
- [ ] Sistema de entidades  
- [ ] Sistema de componentes  
- [ ] Sistema de sistemas  
- [ ] World manager  
- [ ] ECS exposto ao Lua  

---

### 📜 Integração com Lua
- [ ] Módulo `engine-scripting`  
- [ ] Integrar Lua VM (`mlua`)  
- [ ] Wrapper seguro  
- [ ] Carregar `.lua`  
- [ ] Funções básicas (print, log)  
- [ ] API de input  
- [ ] API de tempo  
- [ ] Callbacks (`on_start`, `on_update`, `on_exit`)  

---

### 🎨 Renderização (wgpu)
- [ ] Módulo de render  
- [ ] Janela com `winit`  
- [ ] Inicializar wgpu  
- [ ] Pipeline minimal (clear screen)  
- [ ] Renderer 2D  
- [ ] Sprite renderer  
- [ ] Text renderer  
- [ ] Câmera 2D  
- [ ] API Lua: `draw_sprite`  

---

### 🎮 Sistema de Input
- [ ] Integrar `winit`  
- [ ] API Rust de input  
- [ ] API Lua (`is_key_down`, `is_key_pressed`)  

---

### 🔊 Áudio
- [ ] Integrar `rodio` ou `kira`  
- [ ] Player básico  
- [ ] API Lua (`play_sound`)  

---

### 📦 Assets
- [ ] Asset loader  
- [ ] Cache de texturas  
- [ ] Carregar scripts  
- [ ] Carregar imagens, sons, fontes  
- [ ] Hot reload (opcional)  

---

### 🔧 Ferramentas de Build
- [ ] CLI da engine (`engine-cli`)  
- [ ] Gerador de projetos (`engine new`)  
- [ ] Empacotador de assets  
- [ ] Sistema automático de versão  
- [ ] Bindings Lua automáticos (opcional)  

---

### 🧪 Testes
- [ ] Testes unitários  
- [ ] Testes de integração (Rust ↔ Lua)  
- [ ] Testes de performance  
- [ ] Testes da API Lua  

---

### 📚 Documentação
- [ ] `cargo doc`  
- [ ] Documentação da API Lua  
- [ ] Tutorial: “Seu Primeiro Jogo”  
- [ ] Exemplos práticos (Pong, plataforma simples)  

---

### 🚀 Releases
- [ ] Versão 0.1  
- [ ] Changelog automático  
- [ ] Empacotamento da engine  
- [ ] Página no GitHub Pages  

---

## 📄 Licença

Este projeto está licenciado sob os termos da **MIT License**.  
Consulte o arquivo [LICENSE](LICENSE) para mais detalhes.


