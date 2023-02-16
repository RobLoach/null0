version       = "0.0.1"
author        = "David Konsumer"
description   = "Null0 Game runtime"
license       = "AAL"
srcDir        = "src"
bin           = @["null0"]

requires "nim >= 1.6.10"
requires "https://github.com/beef331/wasm3 >= 0.1.1"
requires "docopt >= 0.7.0"

task clean, "Clean built files":
  exec "rm -f *.wasm *.null0 null0"

task libretro, "Build libretro host":
  exec "nim c --app:lib -d:release src/null0-libretro.nim"

task justlog, "Build a an example logging wasm cart":
  exec "nim c -o:justlog.wasm carts/justlog/main.nim"
  exec "zip justlog.null0 -r main.wasm"
  exec "mv main.wasm justlog.wasm"