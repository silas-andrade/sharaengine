//! Engine core — núcleo mínimo para prototipagem
//!
//! Este módulo contém tipos e utilitários básicos para iniciar o motor em um
//! modo mínimo, com documentação e testes. A intenção é servir como base para
//! funcionalidades posteriores (game loop, configuração, gerenciamento de tempo
//! e subsistemas). Nenhuma dependência nativa pesada é requerida aqui.

use std::time::{Duration, Instant};

/// Configuração simples do Engine.
///
/// Mantemos um tipo minimalista para permitir testes fáceis e documentação.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct EngineConfig {
  /// Nome exibido do motor
  pub name: String,
  /// Tempo alvo por frame (stable default: 60 FPS)
  pub target_frame_time: Duration,
}

impl Default for EngineConfig {
  fn default() -> Self {
    Self {
      name: String::from("Shara Engine"),
      target_frame_time: Duration::from_secs_f32(1.0 / 60.0),
    }
  }
}

/// Engine principal — contém estado mínimo e ciclo de execução.
pub struct Engine {
  config: EngineConfig,
  running: bool,
}

impl Engine {
  /// Cria uma nova instância do `Engine` com a configuração fornecida.
  pub fn new_with_config(cfg: EngineConfig) -> Self {
    Self { config: cfg, running: false }
  }

  /// Cria uma nova instância do `Engine` com `EngineConfig::default()`.
  pub fn new() -> Self {
    Self::new_with_config(EngineConfig::default())
  }

  /// Retorna o nome configurado.
  pub fn name(&self) -> &str {
    &self.config.name
  }

  /// Executa o loop principal por um número opcional de frames.
  ///
  /// Este método é determinístico para testes: recebe `max_frames` opcional que
  /// quando fornecido faz o loop terminar após o número de frames.
  pub fn run(&mut self, max_frames: Option<u32>) {
    self.running = true;
    let mut frames = 0u32;
    let mut last = Instant::now();

    while self.running {
      let now = Instant::now();
      let _delta = now.duration_since(last);
      last = now;

      // ... aqui seriam acionados sistemas, eventos, atualizações etc.

      // Sleep até o próximo frame alvo (simples)
      let elapsed = last.elapsed();
      if elapsed < self.config.target_frame_time {
        std::thread::sleep(self.config.target_frame_time - elapsed);
      }

      frames += 1;
      if let Some(max) = max_frames {
        if frames >= max {
          self.running = false;
        }
      }
    }
  }

  /// Encerra o loop de execução.
  pub fn stop(&mut self) {
    self.running = false;
  }
}

#[cfg(test)]
mod tests {
  use super::*;

  #[test]
  fn default_config_has_name() {
    let cfg = EngineConfig::default();
    assert_eq!(cfg.name, "Shara Engine");
  }

  #[test]
  fn engine_runs_for_given_frames() {
    let mut e = Engine::new();
    // run for 2 frames; should exit quickly
    e.run(Some(2));
    assert!(!e.running, "engine should not be running after run(Some(n))");
  }

  #[test]
  fn engine_stop_works() {
    let mut e = Engine::new();
    // spawn in thread to simulate stop
    let handle = std::thread::spawn(move || {
      let mut engine = e;
      engine.run(Some(1));
      engine
    });
    let _engine = handle.join().expect("thread finished");
  }
}
