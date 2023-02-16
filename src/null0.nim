import  docopt
from os import dirExists, fileExists
import physfs
import wasm3
import wasm3/wasm3c

# TODO: figure out a way to enable with build-flag and CLI param
var allowNetwork = false

# detect if some bytes are a zip file
proc isZip(bytes:string): bool =
  return ord(bytes[0]) == 0x50 and ord(bytes[1]) == 0x4B and ord(bytes[2]) == 0x03 and ord(bytes[3]) == 0x04

# detect if some bytes are a wasm file
proc isWasm(bytes:string): bool =
  return ord(bytes[0]) == 0x00 and ord(bytes[1]) == 0x61 and ord(bytes[2]) == 0x73 and ord(bytes[3]) == 0x6d

# given a filename and some bytes, load a cart
# TODO: move more of other function (detect zip/wasm) in here so it can use from libretro
proc cartLoad(filename:string, data:string): void = 
  if not isWasm(data):
    echo "Cart is not valid (wasm bytes.)"
    return

  proc logProc(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
    proc logProcImpl(c: cstring) =
      echo c
    var sp = sp.stackPtrToUint()
    callHost(logProcImpl, sp, mem)
  
  let env = loadWasmEnv(data, hostProcs = [
    wasmHostProc("*", "null0_log", "v(i)", logProc)
  ])
  try:
    env.findFunction("load", [], []).call(void)
  except WasmError as e:
    echo "null0 load(): ", e.msg


# given a filename, load a cart
proc cartLoad(filename: string): void =
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
      else:
        if not physfs.exists("main.wasm"):
          echo "No main.wasm in " & filename
          return
        let zd = physfs.read("main.wasm")
        cartLoad(filename, zd)
    else:
      echo "Invalid cart (not a wasm or zip file.)"



const doc = """
null0 - Runtime for null0 game-engine

Usage:
  null0 <cart>
  null0 --help
  null0 --net <cart>

<cart>       Specify the cart-name (wasm file or zip/directory with main.wasm in it)

Options:
  -h --help  Show this screen.
  -n,--net   Allow cart to access networking
"""

proc main() =
  let args = docopt(doc, version = "0.0.1")
  let filename = $args["<cart>"]

  if args["--net"]:
    allowNetwork = true
    echo "allowing network"

  if not physfs.init(filename):
    echo "Could not init filesystem."
    return
  cartLoad(filename)

when isMainModule:
  main()
