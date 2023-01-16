import wasm3/exporter

proc null0_log(msgPtr: string) {.importC.}

type
  Config* = object
    name*:string
    version*:string

# entrypoint to your game
proc config():Config {.wasmexport.} =
  return Config(
    name : "mygame",
    version : "0.0.0",
  )

# entrypoint to your game
proc init() {.wasmexport.} =
  null0_log("Hello from game.")

# update data, gets delta-time
proc update(dt: int32) {.wasmexport.} =
  discard

# update scrnee
proc draw() {.wasmexport.} =
  discard