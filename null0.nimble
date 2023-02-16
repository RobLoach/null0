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
  exec("rm -f *.wasm *.null0 null0 tests/test1 null0-libretro.*")

task libretro, "Build libretro host":
  selfExec("c --threads:on --app:staticlib --out:null0-libretro.a -d:release libretro/null0_libretro.nim")
  exec("gcc null0-libretro.a libretro/libretro.c -o null0-libretro.dylib -lphysfs")


task carts, "Builds all demo carts":
  for dir in listDirs("carts"):
    let (parent, name, ext) = os.splitFile(dir)
    exec("cd " & dir & " && nim c main.nim && zip ../../" & name & ".null0 -r main.wasm assets/ && mv main.wasm ../../" & name & ".wasm")