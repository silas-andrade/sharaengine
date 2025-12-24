//! Engine core module (stub)

/// Engine core structure (minimal stub for project structure)
pub struct Engine {
  /// Human-friendly name
  pub name: String,
}

impl Engine {
  /// Create a new engine instance
  pub fn new() -> Self {
    Self { name: String::from("Shara Engine") }
  }

  /// Run the engine (stub)
  pub fn run(&self) {
    println!("{} running (stub)", self.name);
  }
}
