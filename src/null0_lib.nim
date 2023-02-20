from os import dirExists, fileExists
import physfs
import wasm3
import wasm3/wasm3c
import pntr

# TODO: figure out a way to enable with build-flag (for libretro) and not just CLI param
var allowNetwork* = false

var null0_export_load:PFunction
var null0_export_update:PFunction
var null0_export_unload:PFunction

var null0_canvas*:ptr pntr_image
var null0_images*:seq[ptr pntr_image]

proc null0ImportLog(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc logProcImpl(c: cstring) =
    echo c
  var sp = sp.stackPtrToUint()
  callHost(logProcImpl, sp, mem)

proc null0ImportClearBackground(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc clearBackgroundProcImpl(dst: uint8, color: int32) = 
    var image = null0_canvas
    if dst != 0:
      image = null0_images[dst]
    clear_background(image, cast[pntr_color](color))
  var sp = sp.stackPtrToUint()
  callHost(clearBackgroundProcImpl, sp, mem)

proc null0ImportDrawCircle(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc drawCircleProcImpl(dst: uint8, centerX: int, centerY: int, radius:int, color: int32) = 
    var image = null0_canvas
    if dst != 0:
      image = null0_images[dst]
    draw_circle(image, cint centerX, cint centerY, cint radius, cast[pntr_color](color))
  var sp = sp.stackPtrToUint()
  callHost(drawCircleProcImpl, sp, mem)

proc null0ImportDrawPixel(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc drawPixelProcImpl(dst: uint8, x: cint, y: cint, color: int32) = 
    var image = null0_canvas
    if dst != 0:
      image = null0_images[dst]
    draw_pixel(image, cint x, cint y, cast[pntr_color](color))
  var sp = sp.stackPtrToUint()
  callHost(drawPixelProcImpl, sp, mem)

proc null0ImportDrawLine(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc drawLineProcImpl(dst: uint8, startPosX: cint, startPosY: cint, endPosX: cint, endPosY: cint, color: int32) = 
    var image = null0_canvas
    if dst != 0:
      image = null0_images[dst]
    draw_line(image, cint startPosX, cint startPosY, cint endPosX, cint endPosY, cast[pntr_color](color))
  var sp = sp.stackPtrToUint()
  callHost(drawLineProcImpl, sp, mem)

proc null0ImportDrawRectangle(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc drawRectangleProcImpl(dst: uint8, posX: cint, posY: cint, width: cint, height: cint, color: int32) = 
    var image = null0_canvas
    if dst != 0:
      image = null0_images[dst]
    draw_rectangle(image, cint posX, cint posY, cint width, cint height, cast[pntr_color](color))
  var sp = sp.stackPtrToUint()
  callHost(drawRectangleProcImpl, sp, mem)

proc isZip*(bytes:string): bool =
  ## detect if some bytes (at least 4) are a zip file
  return ord(bytes[0]) == 0x50 and ord(bytes[1]) == 0x4B and ord(bytes[2]) == 0x03 and ord(bytes[3]) == 0x04

proc isWasm*(bytes:string): bool =
  ## detect if some bytes (at least 4) are a wasm file
  return ord(bytes[0]) == 0x00 and ord(bytes[1]) == 0x61 and ord(bytes[2]) == 0x73 and ord(bytes[3]) == 0x6d

proc cartUpdate*(): void =
  ## call the update() funciton in cart
  if null0_export_update != nil:
    null0_export_update.call(void)

proc cartUnload*(): void =
  ## call the unload() funciton in cart
  if null0_export_unload != nil:
    null0_export_unload.call(void)

proc cartLoad*(filename:string, data:sink string): void = 
  ## given a filename and some bytes, load a cart
  if not isWasm(data):
    echo "Cart is not valid (wasm bytes.)"
    return

  var env = m3_NewEnvironment()
  var runtime = env.m3_NewRuntime(uint16.high.uint32, nil)
  var module: PModule

  checkWasmRes m3_ParseModule(env, module.addr, cast[ptr uint8](data[0].addr), uint32 data.len)
  checkWasmRes m3_LoadModule(runtime, module)
  checkWasmRes m3LinkWasi(module)
  
  # imports may not be exposed 
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "null0_log", "v(i)", null0ImportLog)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "clear_background", "v(ii)", null0ImportClearBackground)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "draw_circle", "v(iiiii)", null0ImportDrawCircle)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "draw_pixel", "v(iiii)", null0ImportDrawPixel)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "draw_line", "v(iiiiii)", null0ImportDrawLine)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "draw_rectangle", "v(iiiiii)", null0ImportDrawRectangle)
  except WasmError:
    discard

  null0_canvas = new_image(320, 240)
  null0_images = newSeq[ptr pntr_image](255)
  
  try:
    checkWasmRes m3_CompileModule(module)
  except WasmError as e:
    echo e.msg

  try:
    checkWasmRes m3_FindFunction(null0_export_update.addr, runtime, "update")
  except WasmError:
    discard
  try:
    checkWasmRes m3_FindFunction(null0_export_unload.addr, runtime, "unload")
  except WasmError:
    discard
  try:
    checkWasmRes m3_FindFunction(null0_export_load.addr, runtime, "load")
  except WasmError:
    discard

  if null0_export_load != nil:
    null0_export_load.call(void)


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