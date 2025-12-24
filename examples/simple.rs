use sharaengine::Engine;
use sharaengine::engine_scripting;

fn main() {
    // Exemplo mínimo: inicializa subsistemas stub e executa o motor
    let engine = Engine::new();
    engine_scripting::init();
    engine.run();
}
