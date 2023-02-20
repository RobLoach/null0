import ../null0

proc load*() {.wasmexport.} =
  log("Hello from justlog.")

proc update*() {.wasmexport.} =
  discard

proc unload*() {.wasmexport.} =
  log("Ok, bye.")