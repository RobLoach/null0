import os
import system
import physfs
import wasm3
import wasm3/wasm3c
import pntr

# TODO: figure out a way to enable with build-flag (for libretro) and not just CLI param
var allowNetwork* = false

var null0_export_load:PFunction
var null0_export_update:PFunction
var null0_export_unload:PFunction

var null0_images*:array[255, ptr pntr_image]
var null0_fonts*:array[255, ptr pntr_font]

proc fromWasm*(result: var pntr_color, sp: var uint64, mem: pointer) =
  var i: uint32
  i.fromWasm(sp, mem)
  result = cast[ptr pntr_color](cast[uint64](mem) + i)[]

proc fromWasm*(result: var ptr pntr_image, sp: var uint64, mem: pointer) =
  var i: uint32
  i.fromWasm(sp, mem)
  var d = cast[ptr uint8](cast[uint64](mem) + i)[]
  result = null0_images[d]

proc fromWasm*(result: var ptr pntr_font, sp: var uint64, mem: pointer) =
  var i: uint32
  i.fromWasm(sp, mem)
  var d = cast[ptr uint8](cast[uint64](mem) + i)[]
  result = null0_fonts[d]

proc null0Import_log(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc logProcImpl(c: cstring) =
    echo c
  var sp = sp.stackPtrToUint()
  callHost(logProcImpl, sp, mem)

proc null0Import_clear_background(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  var sp = sp.stackPtrToUint()
  callHost(pntr.clear_background, sp, mem)

proc null0Import_draw_circle(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  var sp = sp.stackPtrToUint()
  callHost(pntr.draw_circle, sp, mem)

proc null0Import_draw_pixel(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  var sp = sp.stackPtrToUint()
  callHost(pntr.draw_pixel, sp, mem)

proc null0Import_draw_line(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  var sp = sp.stackPtrToUint()
  callHost(pntr.draw_line, sp, mem)

proc null0Import_draw_rectangle(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  var sp = sp.stackPtrToUint()
  callHost(pntr.draw_rectangle, sp, mem)

proc null0Import_image_crop(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  var sp = sp.stackPtrToUint()
  callHost(pntr.image_crop, sp, mem)

# this should work with callHost, but it doesn't
# proc null0Import_draw_image(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
#   var sp = sp.stackPtrToUint()
#   callHost(pntr.draw_image, sp, mem)

# proc null0Import_draw_text(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
#   var sp = sp.stackPtrToUint()
#   callHost(pntr.image_crop, sp, mem)

proc null0Import_draw_image(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc drawImageProcImpl(dst: uint8, src: uint8, posX: cint, posY: cint) =
    pntr.draw_image(null0_images[dst], null0_images[src], posX, posY)
  var sp = sp.stackPtrToUint()
  callHost(drawImageProcImpl, sp, mem)

proc null0Import_draw_text(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc drawTextProcImpl(dst: uint8, font: uint8, text: cstring, posX: cint, posY: cint) =
    pntr.draw_text(null0_images[dst], null0_fonts[font], text, posX, posY)
  var sp = sp.stackPtrToUint()
  callHost(drawTextProcImpl, sp, mem)

# procs that load stuff need wrapping

proc null0Import_image_copy(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc imageCopyProcImpl(destination: uint8, source: uint8): uint8 =
    null0_images[destination] = pntr.image_copy(null0_images[source])
  var sp = sp.stackPtrToUint()
  callHost(imageCopyProcImpl, sp, mem)

proc null0Import_load_image(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc loadImageProcImpl(destination: uint8, filename: cstring) =
    var bytes = physfs.read($filename)
    var dataSize = cuint fileLength($filename)
    null0_images[destination] = pntr.load_image_from_memory(bytes, dataSize)
  var sp = sp.stackPtrToUint()
  callHost(loadImageProcImpl, sp, mem)


proc isZip*(bytes: string): bool =
  ## detect if some bytes (at least 4) are a zip file
  return ord(bytes[0]) == 0x50 and ord(bytes[1]) == 0x4B and ord(bytes[2]) == 0x03 and ord(bytes[3]) == 0x04

proc isWasm*(bytes: string): bool =
  ## detect if some bytes (at least 4) are a wasm file
  return ord(bytes[0]) == 0x00 and ord(bytes[1]) == 0x61 and ord(bytes[2]) == 0x73 and ord(bytes[3]) == 0x6d

proc isWasm*(bytes: ptr UncheckedArray[byte]): bool =
  ## detect if some bytes (at least 4) are a wasm file
  var b = cast[ptr array[4, byte]](bytes)
  return b[0] == 0x00 and b[1] == 0x61 and b[2] == 0x73 and b[3] == 0x6d

proc isZip*(bytes: ptr UncheckedArray[byte]): bool =
  ## detect if some bytes (at least 4) are a wasm file
  var b = cast[ptr array[4, byte]](bytes)
  return b[0] == 0x50 and b[1] == 0x4B and b[2] == 0x03 and b[3] == 0x04

proc cartUpdate*(): void =
  ## call the update() funciton in cart
  if null0_export_update != nil:
    null0_export_update.call(void)

proc cartUnload*(): void =
  ## call the unload() funciton in cart
  if null0_export_unload != nil:
    null0_export_unload.call(void)

proc cartLoad*(filename:string, data: ptr UncheckedArray[byte], length: uint64) = 
  ## given a filename and some bytes, load a cart

  if not isWasm(data):
    echo "Cart is not valid (wasm bytes.)"
    return

  null0_images[0] = new_image(320, 240)
  null0_fonts[0] = load_default_font()

  var env = m3_NewEnvironment()
  var runtime = env.m3_NewRuntime(uint16.high.uint32, nil)
  var module: PModule

  checkWasmRes m3_ParseModule(env, module.addr, cast[ptr uint8](data), uint32 length)
  checkWasmRes m3_LoadModule(runtime, module)
  checkWasmRes m3LinkWasi(module)
  
  # imports may not be exposed 
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "null0_log", "v(*)", null0Import_log)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "clear_background", "v(ii)", null0Import_clear_background)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "draw_circle", "v(iiiii)", null0Import_draw_circle)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "draw_pixel", "v(iiii)", null0Import_draw_pixel)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "draw_line", "v(iiiiii)", null0Import_draw_line)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "draw_rectangle", "v(iiiiii)", null0Import_draw_rectangle)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "draw_image", "v(iiii)", null0Import_draw_image)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "draw_text", "v(iiiii)", null0Import_draw_text)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "image_copy", "v(ii)", null0Import_image_copy)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "image_crop", "v(iiiii)", null0Import_image_crop)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "load_image", "v(i*)", null0Import_load_image)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "draw_image", "v(iiii)", null0Import_draw_image)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "draw_text", "v(ii*ii)", null0Import_draw_text)
  except WasmError:
    discard

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

  if (os.dirExists(filename)):
    if not physfs.mount(filename, "", true):
      echo "Could not mount " & filename
      return
    if not physfs.exists("main.wasm"):
      echo "No main.wasm in " & filename
      return
    let data = physfs.read("main.wasm")
    var f = physfs.openRead("main.wasm")
    var l = uint64 f.fileLength
    f.close()
    cartLoad(filename, data, l)
  else:
    if not os.fileExists(filename):
      echo "Could not find " & filename
      return
    var l = os.getFileSize(filename)
    var data = cast[ptr UncheckedArray[byte]](alloc(l))
    var f = system.open(filename)
    discard system.readBuffer(f, data, l)
    f.close()
    if (isWasm(data)):
      cartLoad(filename, data, uint64 l)
    elif isZip(data):
      if not physfs.mountMemory(data, l, filename, "", true):
        echo "Could not mount " & filename
        return
      if not physfs.exists("main.wasm"):
        echo "No main.wasm in " & filename
        return
      let data = physfs.read("main.wasm")
      var f = physfs.openRead("main.wasm")
      var l = uint64 f.fileLength
      f.close()
      cartLoad(filename, data, l)
    else:
      echo "Invalid cart (not a wasm or zip file.)"
