description   = "Libretro core for null0 game-engine"
version       = "0.0.1"
author        = "David Konsumer"
license       = "MIT"
srcDir        = "src"
bin           = @["null0"]

requires "nim >= 1.6.10"
requires "https://github.com/beef331/wasm3 >= 0.1.1"

task clean, "Clean built files":
  exec "rm -f null0.wasm null0"

task wasm, "Build wasm":
  exec "rustc --target wasm32-unknown-unknown null0.rs -o null0.wasm --crate-type cdylib"