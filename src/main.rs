use sharaengine::Engine;
use sharaengine::engine_scripting::Scripting;
use std::process;

fn main() {
    // Inicializa subsistemas
    let mut engine = Engine::new();

    let scripting = match Scripting::init() {
        Ok(s) => s,
        Err(e) => {
            eprintln!("Failed to initialize scripting: {}", e);
            process::exit(1);
        }
    };

    // Run a minimal loop of the engine (deterministic in this example)
    engine.run(Some(2));
    println!("Engine '{}' shut down cleanly.", engine.name());
    drop(scripting);
}
