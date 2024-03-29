version       = "0.0.1"
author        = "David Konsumer"
description   = "Null0 Game runtime"
license       = "AAL"
skipDirs = @["tests", "carts", "libretro", "src"]

requires "nim >= 1.6.10"
requires "https://github.com/beef331/wasm3 >= 0.1.7"
requires "docopt >= 0.7.0"

import std/os
import std/strutils
import std/strformat

task clean, "Clean built files":
  for file in listFiles("tests"):
    if file.startsWith("tests/test_") and not file.endsWith(".nim"):
      echo "Deleting ", file
      rmFile(file)
  for file in listFiles("."):
    let s = splitFile(file)
    if file == "./null0" or file == "./demo.png" or (file.startsWith("./test-") and file.endsWith(".png")) or s.ext == ".dll" or s.ext == ".so" or s.ext == ".dylib" or s.ext == ".wasm" or s.ext == ".null0":
      echo "Deleting ", file
      rmFile(file)

task runtime, "Build standalone runtime":
  selfExec("c --panics:on -d:release  --outDir=. -o:null0 src/null0_runtime.nim")

task libretro, "Build libretro host":
  selfExec("c --panics:on -d:release --app:lib --noMain --gc:orc --outDir=. src/null0_libretro.nim")

# TODO: this will only work on linux/mac
task cart, "Build a demo cart":
  let name = paramStr(paramCount())
  let dir = "src/carts/" & name
  exec(fmt"cd {dir} && nim c main.nim && zip ../../../{name}.null0 -r main.wasm assets/ && mv main.wasm ../../../{name}.wasm")

task carts, "Builds all demo carts":
  for dir in listDirs("src/carts"):
    let (parent, name, ext) = os.splitFile(dir)
    exec("nimble cart " & name)