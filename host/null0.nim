import unittest
import wasm3
import wasm3/wasm3c
import os
import std/parseopt
import system

if paramCount() == 0:
  quit("Usage: null0 <WASMFILE>")

proc null0_log(runtime: PRuntime, ctx: PImportContext,  sp: ptr uint64, mem: pointer): pointer {.cdecl.} =
  discard

let env = loadWasmEnv(readFile(os.commandLineParams()[0]), hostProcs = [wasmHostProc("*", "null0_log", "v(i)", null0_log)])
