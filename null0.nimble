version       = "0.0.1"
author        = "David Konsumer"
description   = "Null0 Game runtime"
license       = "AAL"
srcDir        = "src"
bin           = @["null0"]

requires "nim >= 1.6.10"
requires "https://github.com/beef331/wasm3 >= 0.1.7"
requires "docopt >= 0.7.0"

import std/os

task clean, "Clean built files":
  exec("rm -f *.wasm *.null0 null0 tests/test1")

task libretro, "Build libretro host":
  selfExec("c --app:lib -d:release src/null0-libretro.nim")

task carts, "Builds all demo carts":
  for file in listDirs("carts"):
    selfExec("c " & file & "/main.nim")
    echo file
    let (dir, name, ext) = os.splitFile(file)
    exec("zip " & name & ".null0 -r main.wasm")
    exec("mv main.wasm " & name & ".wasm")