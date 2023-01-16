description   = "Libretro core for null0 game-engine"
version       = "0.0.1"
author        = "David Konsumer"
license       = "MIT"
srcDir        = "src"
bin           = @["null0"]

requires "nim >= 1.6.10"
requires "https://github.com/beef331/wasm3 >= 0.1.1"

task clean, "Clean built files":
  exec "rm -f *.wasm null0"

task wasm, "Build wasm cart":
  exec "nim c cart/example.nim"