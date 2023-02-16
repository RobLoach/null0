import ../src/physfs
import ../src/null0_lib

# entry-point for libretro
proc null0_libretro_main*(filename:cstring, data:cstring, size: cint): cint {.stdcall,exportc,dynlib.} =
  echo "nim: ", filename, " ", size
  if not physfs.init($filename):
    echo "Could not init filesystem."
    return 0
  if isWasm($data):
    cartLoad($filename, $data)
  elif isZip($data):
    if not physfs.mountMemory($data, $filename, "", true):
      echo "Could not mount " & $filename
      return 0
    if not physfs.exists("main.wasm"):
      echo "No main.wasm in " & $filename
      return 0
    let zd = physfs.read("main.wasm")
    cartLoad($filename, zd)
  else:
    echo "Could not load cart."
    return 0
  return 1

# no input or output
proc null0_test1*(): void {.stdcall,exportc,dynlib.} = 
  echo("test1 working")

# int output
proc null0_test2*(): cint {.stdcall,exportc,dynlib.} = 
  echo("test2 working")
  return 1

# int input/output
proc null0_test3*(input:cint): cint {.stdcall,exportc,dynlib.} = 
  echo("test3 working")
  echo(input, "\n")
  return 1

# string input, int output
proc null0_test4*(message:cstring): cint {.stdcall,exportc,dynlib.} = 
  echo("test4 working")
  echo(message)
  return 1