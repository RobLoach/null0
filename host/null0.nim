import unittest
import wasm3
import wasm3/wasm3c

proc null0_log(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc null0_log_inside(message: string) = echo(message)
  callWasm(null0_log_inside, sp, mem)

let env = loadWasmEnv(readFile("example.wasm"), hostProcs = [wasmHostProc("*", "null0_log", "i(i)", null0_log)])