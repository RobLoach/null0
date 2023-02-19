import wasm3/exporter

proc null0_log(s: cstring){.importc.}
proc clear_screen(dest: uint8, color: int32){.importc.}
const BLACK = int32 0x000000FF

proc load*() {.wasmexport.} =
  null0_log("Hello from graphics.")

proc update*() {.wasmexport.} =
  clear_screen(0, BLACK)

proc unload*() {.wasmexport.} =
  null0_log("Ok, bye.")