//! Shara Engine root library

pub mod engine_core;
pub mod engine_scripting;

pub use engine_core::Engine;

#[cfg(test)]
mod tests {
  use super::*;

  #[test]
  fn engine_new_works() {
    let e = Engine::new();
    assert_eq!(e.name, "Shara Engine");
  }
}
