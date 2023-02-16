import wasm3/exporter

proc log(s: cstring){.importc.}

proc load*() {.wasmexport.} =
  log("Hello World")

proc unload*() {.wasmexport.} =
  log("ok, bye.")

