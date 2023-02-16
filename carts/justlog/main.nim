import wasm3/exporter

proc null0_log(s: cstring){.importc.}

proc load*() {.wasmexport.} =
  null0_log("Hello")
  null0_log("World")
  var a = "This is a test"
  null0_log a.cstring