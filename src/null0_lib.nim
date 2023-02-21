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

var null0_images*:seq[ptr pntr_image]

proc fromWasm*(result: var pntr_color, sp: var uint64, mem: pointer) =
  var i: uint32
  i.fromWasm(sp, mem)
  result = cast[ptr pntr_color](cast[uint64](mem) + i)[]

proc fromWasm*(result: var ptr pntr_image, val: uint8, mem: pointer) =
  echo val
  result = null0_images[val]

proc null0Import_log(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc logProcImpl(c: cstring) =
    echo c
  var sp = sp.stackPtrToUint()
  callHost(logProcImpl, sp, mem)

proc null0Import_clear_background(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  var sp = sp.stackPtrToUint()
  callHost(clear_background, sp, mem)

proc null0Import_draw_circle(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  var sp = sp.stackPtrToUint()
  callHost(draw_circle, sp, mem)

proc null0Import_draw_pixel(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  var sp = sp.stackPtrToUint()
  callHost(draw_pixel, sp, mem)

proc null0Import_draw_line(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  var sp = sp.stackPtrToUint()
  callHost(draw_line, sp, mem)

proc null0Import_draw_rectangle(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  var sp = sp.stackPtrToUint()
  callHost(draw_rectangle, sp, mem)

proc null0Import_draw_image(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  var sp = sp.stackPtrToUint()
  callHost(draw_image, sp, mem)

proc null0Import_draw_text(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  var sp = sp.stackPtrToUint()
  callHost(draw_text, sp, mem)

proc null0Import_image_crop(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  var sp = sp.stackPtrToUint()
  callHost(image_crop, sp, mem)

proc null0Import_image_copy(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc ImageCopyProcImpl(destination: uint8, source: uint8): uint8 =
    null0_images[destination] = image_copy(null0_images[source])
  var sp = sp.stackPtrToUint()
  callHost(ImageCopyProcImpl, sp, mem)

proc null0Import_load_image(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  var sp = sp.stackPtrToUint()
  extractAs(destination, uint8, sp, mem)
  extractAs(filename, cstring, sp, mem)
  # var bytes: string = physfs.read($filename)
  # null0_images[destination] = load_image_from_memory(addr bytes, dataSize)


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

# proc cartLoad*(filename:string, data:sink string): void = 
#   ## given a filename and some bytes, load a cart
#   if not isWasm(data):
#     echo "Cart is not valid (wasm bytes.)"
#     return

#   var env = m3_NewEnvironment()
#   var runtime = env.m3_NewRuntime(uint16.high.uint32, nil)
#   var module: PModule

#   checkWasmRes m3_ParseModule(env, module.addr, cast[ptr uint8](data[0].addr), uint32 data.len)
#   checkWasmRes m3_LoadModule(runtime, module)
#   checkWasmRes m3LinkWasi(module)
  
#   # imports may not be exposed 
#   try:
#     checkWasmRes m3_LinkRawFunction(module, "*", "null0_log", "v(*)", null0Import_log)
#   except WasmError:
#     discard
#   try:
#     checkWasmRes m3_LinkRawFunction(module, "*", "clear_background", "v(ii)", null0Import_clear_background)
#   except WasmError:
#     discard
#   try:
#     checkWasmRes m3_LinkRawFunction(module, "*", "draw_circle", "v(iiiii)", null0Import_draw_circle)
#   except WasmError:
#     discard
#   try:
#     checkWasmRes m3_LinkRawFunction(module, "*", "draw_pixel", "v(iiii)", null0Import_draw_pixel)
#   except WasmError:
#     discard
#   try:
#     checkWasmRes m3_LinkRawFunction(module, "*", "draw_line", "v(iiiiii)", null0Import_draw_line)
#   except WasmError:
#     discard
#   try:
#     checkWasmRes m3_LinkRawFunction(module, "*", "draw_rectangle", "v(iiiiii)", null0Import_draw_rectangle)
#   except WasmError:
#     discard
#   try:
#     checkWasmRes m3_LinkRawFunction(module, "*", "draw_image", "v(iiii)", null0Import_draw_image)
#   except WasmError:
#     discard
#   try:
#     checkWasmRes m3_LinkRawFunction(module, "*", "draw_text", "v(iiiii)", null0Import_draw_text)
#   except WasmError:
#     discard
#   try:
#     checkWasmRes m3_LinkRawFunction(module, "*", "image_copy", "v(ii)", null0Import_image_copy)
#   except WasmError:
#     discard
#   try:
#     checkWasmRes m3_LinkRawFunction(module, "*", "image_crop", "v(iiiii)", null0Import_image_crop)
#   except WasmError:
#     discard
#   try:
#     checkWasmRes m3_LinkRawFunction(module, "*", "load_image", "v(i*)", null0Import_load_image)
#   except WasmError:
#     discard
#   try:
#     checkWasmRes m3_LinkRawFunction(module, "*", "draw_image", "v(iiii)", null0Import_draw_image)
#   except WasmError:
#     discard

#   null0_images = newSeq[ptr pntr_image](255)
#   null0_images[0] = new_image(320, 240)
  
#   try:
#     checkWasmRes m3_CompileModule(module)
#   except WasmError as e:
#     echo e.msg

#   try:
#     checkWasmRes m3_FindFunction(null0_export_update.addr, runtime, "update")
#   except WasmError:
#     discard
#   try:
#     checkWasmRes m3_FindFunction(null0_export_unload.addr, runtime, "unload")
#   except WasmError:
#     discard
#   try:
#     checkWasmRes m3_FindFunction(null0_export_load.addr, runtime, "load")
#   except WasmError:
#     discard

#   if null0_export_load != nil:
#     null0_export_load.call(void)


# proc cartLoad*(filename: string): void =
#   ## given a filename, load a cart
#   if (dirExists(filename)):
#     if not physfs.mount(filename, "", true):
#       echo "Could not mount " & filename
#       return
#     if not physfs.exists("main.wasm"):
#       echo "No main.wasm in " & filename
#       return
#     let data = physfs.read("main.wasm")
#     cartLoad(filename, data)
#   else:
#     if not fileExists(filename):
#       echo "Could not find " & filename
#       return
#     var data = readFile(filename)
#     if (isWasm(data)):
#       cartLoad(filename, data)
#     elif isZip(data):
#       if not physfs.mountMemory(data, filename, "", true):
#         echo "Could not mount " & filename
#         return
#       if not physfs.exists("main.wasm"):
#         echo "No main.wasm in " & filename
#         return
#       let zd = physfs.read("main.wasm")
#       cartLoad(filename, zd)
#     else:
#       echo "Invalid cart (not a wasm or zip file.)"