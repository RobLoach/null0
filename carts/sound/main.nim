import ../null0

proc load*() {.wasmexport.} =
  log("Hello from sound.")

proc update*() {.wasmexport.} =
  clear_background(BLACK)

proc unload*() {.wasmexport.} =
  log("Ok, bye.")