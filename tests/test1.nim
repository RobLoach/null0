import unittest
import wasm3
import wasm3/wasm3c
import ../src/null0_lib
import ../src/physfs

suite "Physfs":
  test "mount zip file and read from it":
    check init("test")
    check mount("graphics.null0", "", true)
    check exists("assets/logo-white.png")
    var f = openRead("assets/logo-white.png")
    var l = uint64 f.fileLength
    check l == 11228
    var buffer:pointer = alloc(l)
    var b = uint64 f.readBytes(buffer, l)
    f.close()
    check b == l
    discard deinit()

  test "mount zip file and read from it using read()":
    check init("test")
    check mount("graphics.null0", "", true)
    var b = read("assets/logo-white.png")
    discard deinit()


suite "Cart Utils":
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

suite "wasm (justlog)":
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







