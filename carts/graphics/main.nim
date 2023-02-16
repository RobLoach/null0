import wasm3/exporter

proc null0_log(s: cstring){.importc.}

proc load*() {.wasmexport.} =
  null0_log("Hello from graphics.")

proc unload*() {.wasmexport.} =
  null0_log("Ok, bye.")