import unittest
import wasm3
import wasm3/wasm3c
import ../src/null0/null0
import ../src/null0/physfs


suite "Null0: Cart Utils":
  test "isZip":
    let w = readFile("justlog.wasm")
    let z = readFile("justlog.null0")
    check isZip(z)
    check isZip(w) != true
  
  test "isWasm":
    let w = readFile("justlog.wasm")
    let z = readFile("justlog.null0")
    check isWasm(w)
    check isWasm(z) != true

  test "isWasm in zip":
    check init("test")
    check mount("justlog.null0", "", true)
    var b = read("main.wasm")
    check isWasm(b)
    discard deinit()

suite "Null0: wasm (justlog)":
  test "Setup log hook function and call it":
    proc logProc(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
      var sp = sp.stackPtrToUint()
      extractAs(msg, cstring, sp, mem)
      echo msg
    let env = loadWasmEnv(readFile("justlog.wasm"), hostProcs = [
      wasmHostProc("*", "null0_log", "v(i)", logProc)
    ])
    let cart_export_load = env.findFunction("load", [], [])
    cart_export_load.call(void)

  test "Setup log hook function and call it, when it doesn't exist":
    proc logProc(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
      var sp = sp.stackPtrToUint()
      extractAs(msg, cstring, sp, mem)
      echo msg
    let env = loadWasmEnv(readFile("justlog.wasm"), hostProcs = [
      wasmHostProc("*", "null0_log", "v(i)", logProc)
    ])
    try:
      let cart_export_load = env.findFunction("loadbad", [], [])
      cart_export_load.call(void)
    except WasmError as e:
      echo "more chill error: ", e.msg

  test "Setup log hook function and call it, using callHost":
    proc logProc(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
      proc logProcImpl(c: cstring) =
        echo c
      var sp = sp.stackPtrToUint()
      callHost(logProcImpl, sp, mem)
    let env = loadWasmEnv(readFile("justlog.wasm"), hostProcs = [
      wasmHostProc("*", "null0_log", "v(i)", logProc)
    ])
    env.findFunction("load", [], []).call(void)







