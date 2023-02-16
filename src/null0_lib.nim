from os import dirExists, fileExists
import physfs
import wasm3
import wasm3/wasm3c

# TODO: figure out a way to enable with build-flag (for libretro) and not just CLI param
var allowNetwork* = false

var null0_export_load:PFunction

proc null0ImportLog(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc logProcImpl(c: cstring) =
    echo c
  var sp = sp.stackPtrToUint()
  callHost(logProcImpl, sp, mem)

proc isZip*(bytes:string): bool =
  ## detect if some bytes (at least 4) are a zip file
  return ord(bytes[0]) == 0x50 and ord(bytes[1]) == 0x4B and ord(bytes[2]) == 0x03 and ord(bytes[3]) == 0x04

proc isWasm*(bytes:string): bool =
  ## detect if some bytes (at least 4) are a wasm file
  return ord(bytes[0]) == 0x00 and ord(bytes[1]) == 0x61 and ord(bytes[2]) == 0x73 and ord(bytes[3]) == 0x6d

proc cartLoad*(filename:string, data:string): void = 
  ## given a filename and some bytes, load a cart
  if not isWasm(data):
    echo "Cart is not valid (wasm bytes.)"
    return
  
  let env = loadWasmEnv(data, hostProcs = [
    wasmHostProc("*", "null0_log", "v(i)", null0ImportLog)
  ])
  try:
    null0_export_load = env.findFunction("load", [], [])
    null0_export_load.call(void)
  except WasmError as e:
    echo "null0 load(): ", e.msg


proc cartLoad*(filename: string): void =
  ## given a filename, load a cart
  if (dirExists(filename)):
    if not physfs.mount(filename, "", true):
      echo "Could not mount " & filename
      return
    if not physfs.exists("main.wasm"):
      echo "No main.wasm in " & filename
      return
    let data = physfs.read("main.wasm")
    cartLoad(filename, data)
  else:
    if not fileExists(filename):
      echo "Could not find " & filename
      return
    let data = readFile(filename)
    if (isWasm(data)):
      cartLoad(filename, data)
    elif isZip(data):
      if not physfs.mountMemory(data, filename, "", true):
        echo "Could not mount " & filename
        return
      if not physfs.exists("main.wasm"):
        echo "No main.wasm in " & filename
        return
      let zd = physfs.read("main.wasm")
      cartLoad(filename, zd)
    else:
      echo "Invalid cart (not a wasm or zip file.)"