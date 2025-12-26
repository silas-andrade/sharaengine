//! Engine scripting — wrapper mínimo em torno de mlua (stub)
//!
//! O objetivo aqui é prover uma abstração simples que podemos expandir.

use std::path::Path;

/// Representa o subsistema de scripting da engine.
pub struct Scripting {
    initialized: bool,
}

impl Scripting {
    /// Tenta inicializar a camada de scripting.
    /// Retorna erro textual em caso de falha (por ora, apenas simulado).
    pub fn init() -> Result<Self, String> {
        // No futuro aqui inicializamos `mlua` com configurações seguras.
        Ok(Self { initialized: true })
    }

    /// Tenta carregar um script de arquivo — por enquanto apenas valida a path.
    pub fn load_script<P: AsRef<Path>>(&self, path: P) -> Result<(), String> {
        if !self.initialized {
            return Err(String::from("scripting subsystem not initialized"));
        }
        let p = path.as_ref();
        if !p.exists() {
            return Err(format!("script path does not exist: {}", p.display()));
        }
        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::fs::File;
    use tempfile::tempdir;

    #[test]
    fn init_returns_ok() {
        let s = Scripting::init();
        assert!(s.is_ok());
    }

    #[test]
    fn load_script_requires_file() {
        let s = Scripting::init().expect("init ok");
        let tmp = tempdir().expect("tmpdir");
        let file_path = tmp.path().join("script.lua");
        File::create(&file_path).expect("create file");
        assert!(s.load_script(&file_path).is_ok());
    }
}
