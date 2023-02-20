version       = "0.0.1"
author        = "David Konsumer"
description   = "Null0 Game runtime"
license       = "AAL"
srcDir        = "src"
bin           = @["null0"]

requires "nim >= 1.6.10"
requires "https://github.com/beef331/wasm3 >= 0.1.7"
requires "docopt >= 0.7.0"
requires "https://github.com/treeform/print.git >= 1.0.2"
requires "https://github.com/notnullgames/pntr-nim.git"

import std/os

task clean, "Clean built files":
  exec("rm -f *.wasm *.null0 null0 tests/test1 null0-libretro.*")

task libretro, "Build libretro host":
  selfExec("c -d:release --app:lib --noMain --gc:orc --outDir=. libretro/null0_libretro.nim")

task carts, "Builds all demo carts":
  for dir in listDirs("carts"):
    let (parent, name, ext) = os.splitFile(dir)
    exec("cd " & dir & " && nim c main.nim && zip ../../" & name & ".null0 -r main.wasm assets/ && mv main.wasm ../../" & name & ".wasm")