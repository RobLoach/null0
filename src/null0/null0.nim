import os
import system
import physfs
import wasm3
import wasm3/wasm3c
import pntr
import std/strformat
import soloud
import std/times

type
  Null0Buttons* = array[16, bool]

# TODO: figure out a way to enable with build-flag (for libretro) and not just CLI param
var allowNetwork* = false

var null0_export_load:PFunction
var null0_export_update:PFunction
var null0_export_unload:PFunction
var null0_export_buttonDown:PFunction
var null0_export_buttonUp:PFunction

var null0_images*:array[255, ptr pntr_image]
var null0_fonts*:array[255, ptr pntr_font]
var null0_sounds*:array[255, pointer]
var null0_buttons*: Null0Buttons
var null0_sound*: Soloud
var aBuffer*: pointer

var null0_time = now()

const FRAME_RATE* = 60
const SAMPLE_RATE* = 48000
const SAMPLES_PER_FRAME* = SAMPLE_RATE / FRAME_RATE

const BUTTON_B* = 0
const BUTTON_Y* = 1
const BUTTON_SELECT* = 2
const BUTTON_START* = 3
const BUTTON_UP* = 4
const BUTTON_DOWN* = 5
const BUTTON_LEFT* = 6
const BUTTON_RIGHT* = 7
const BUTTON_A* = 8
const BUTTON_X* = 9
const BUTTON_L* = 10
const BUTTON_R* = 11
const BUTTON_L2* = 12
const BUTTON_R2* = 13
const BUTTON_L3* = 14
const BUTTON_R3* = 15

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

proc null0Import_draw_image(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc procImpl(dst: uint8, src: uint8, posX: cint, posY: cint) =
    if not isNil(null0_images[dst]) and not isNil(null0_images[src]):
      pntr.draw_image(null0_images[dst], null0_images[src], posX, posY)
      let err = pntr.get_error()
      if not isNil(err):
        echo "draw_image error: ", err
  var sp = sp.stackPtrToUint()
  callHost(procImpl, sp, mem)

proc null0Import_draw_text(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc procImpl(dst: uint8, font: uint8, text: cstring, posX: cint, posY: cint) =
    pntr.draw_text(null0_images[dst], null0_fonts[font], text, posX, posY)
    let err = pntr.get_error()
    if not isNil(err):
      echo "draw_text error: ", err
  var sp = sp.stackPtrToUint()
  callHost(procImpl, sp, mem)

proc null0Import_gradient_vertical(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc procImpl(dst: uint8, width: cint; height: cint; top: pntr_color; bottom: pntr_color) =
    null0_images[dst] = gen_image_gradient_vertical(width, height, top, bottom)
    let err = pntr.get_error()
    if not isNil(err):
      echo "gradient_vertical error: ", err
  var sp = sp.stackPtrToUint()
  callHost(procImpl, sp, mem)

proc null0Import_gradient_horizontal(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc procImpl(dst: uint8, width: cint; height: cint; left: pntr_color; right: pntr_color) =
    null0_images[dst] = gen_image_gradient_horizontal(width, height, left, right)
    let err = pntr.get_error()
    if not isNil(err):
      echo "gradient_horizontal error: ", err
  var sp = sp.stackPtrToUint()
  callHost(procImpl, sp, mem)

proc null0Import_image_copy(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc procImpl(destination: uint8, source: uint8): uint8 =
    null0_images[destination] = pntr.image_copy(null0_images[source])
    let err = pntr.get_error()
    if not isNil(err):
      echo "image_copy error: ", err
  var sp = sp.stackPtrToUint()
  callHost(procImpl, sp, mem)

proc null0Import_image_scale(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc procImpl(destination: uint8, source: uint8, scaleX: cfloat, scaleY: cfloat) =
    null0_images[destination] = pntr.image_scale(null0_images[source], scaleX, scaleY, PNTR_FILTER_DEFAULT)
    let err = pntr.get_error()
    if not isNil(err):
      echo "image_scale error: ", err
  var sp = sp.stackPtrToUint()
  callHost(procImpl, sp, mem)

proc null0Import_load_image(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc procImpl(destination: uint8, filename: cstring) =
    var f = physfs.read($filename)
    null0_images[destination] = pntr.load_image_from_memory(f.data, cuint f.length)
    let err = pntr.get_error()
    if not isNil(err):
      echo "load_image error: ", err
  var sp = sp.stackPtrToUint()
  callHost(procImpl, sp, mem)

proc null0Import_load_font_bmfont(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc procImpl(destination: uint8, filename: cstring, characters: cstring) =
    var f = physfs.read($filename)
    null0_fonts[destination] = pntr.load_bmfont_from_memory(f.data, cuint f.length, characters)
    let err = pntr.get_error()
    if not isNil(err):
      echo "load_font_bmfont error: ", err
  var sp = sp.stackPtrToUint()
  callHost(procImpl, sp, mem)

proc null0Import_load_font_ttyfont(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc procImpl(destination: uint8, filename: cstring, glyphWidth: cint, glyphHeight: cint, characters: cstring) =
    var f = physfs.read($filename)
    null0_fonts[destination] = pntr.load_ttyfont_from_memory(f.data, cuint f.length, glyphWidth, glyphHeight, characters)
    let err = pntr.get_error()
    if not isNil(err):
      echo "load_font_ttyfont error: ", err
  var sp = sp.stackPtrToUint()
  callHost(procImpl, sp, mem)

proc null0Import_load_font_ttffont(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc procImpl(destination: uint8, filename: cstring, fontSize: cint, fontColor: pntr_color) =
    var f = physfs.read($filename)
    null0_fonts[destination] = pntr.load_ttffont_from_memory(f.data, cuint f.length, fontSize, fontColor)
    let err = pntr.get_error()
    if not isNil(err):
      echo "load_font_ttffont error: ", err
  var sp = sp.stackPtrToUint()
  callHost(procImpl, sp, mem)

proc null0Import_load_speech(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc procImpl(destination: uint8, text: cstring) =
    null0_sounds[destination] = Speech_create()
    discard Speech_setText(null0_sounds[destination], text)
  var sp = sp.stackPtrToUint()
  callHost(procImpl, sp, mem)

proc null0Import_load_sound(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc procImpl(destination: uint8, filename: cstring) =
    null0_sounds[destination] = Wav_create()
    let c = physfs.read($filename)
    discard Wav_loadMemEx(null0_sounds[destination], unsafeAddr c.data[0], cuint c.length, 1, 0)
  var sp = sp.stackPtrToUint()
  callHost(procImpl, sp, mem)

proc null0Import_play_sound(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc procImpl(destination: uint8) =
    discard Soloud_play(null0_sound, null0_sounds[destination])
  var sp = sp.stackPtrToUint()
  callHost(procImpl, sp, mem)

proc null0Import_set_sound_loop(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc procImpl(destination: uint8, loop: bool) =
    Wav_setLooping(null0_sounds[destination], loop)
  var sp = sp.stackPtrToUint()
  callHost(procImpl, sp, mem)

proc null0Import_stop_sound(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc procImpl(destination: uint8) =
    Soloud_stopAudioSource(null0_sound, null0_sounds[destination])
  var sp = sp.stackPtrToUint()
  callHost(procImpl, sp, mem)

proc null0Import_draw_image_rotated(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  proc procImpl(dst: uint8, src: uint8, posX: cint, posY: cint, rotation: cfloat, offsetX: cfloat, offsetY: cfloat) =
    if not isNil(null0_images[dst]) and not isNil(null0_images[src]):
      pntr.draw_image_rotated(null0_images[dst], null0_images[src], posX, posY, rotation, offsetX, offsetY, PNTR_FILTER_DEFAULT)
      let err = pntr.get_error()
      if not isNil(err):
        echo "draw_image_rotated error: ", err
  var sp = sp.stackPtrToUint()
  callHost(procImpl, sp, mem)



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

proc isWasm*(f:FileData): bool =
  ## detect if some bytes (at least 4) are a wasm file
  return isWasm(f.data)

proc isZip*(f:FileData): bool =
  ## detect if some bytes (at least 4) are a wasm file
  return isZip(f.data)

proc cartUpdate*(): void =
  ## call the update() funciton in cart
  var dt = now() - null0_time
  if null0_export_update != nil:
    null0_export_update.call(void, dt.inMilliseconds)

proc cartUnload*(): void =
  ## call the unload() funciton in cart
  Soloud_cleanup(null0_sound)
  dealloc(aBuffer)
  if null0_export_unload != nil:
    null0_export_unload.call(void)
  for image in null0_images:
    if image != nil:
      # echo image[]
      pntr.unload_image(image)
  for font in null0_fonts:
    if font != nil:
      # echo font[]
      pntr.unload_font(font)

proc cartButtonHandle*(button:cuint, state: bool) = 
  ## call this to update button-state - this can be hammerd in host, and will only call buttonUp/buttonDown on change
  if null0_buttons[button] != state:
    null0_buttons[button] = state
    if state:
      if null0_export_ButtonDown != nil:
        null0_export_ButtonDown.call(void, button)
    else:
      if null0_export_ButtonUp != nil:
        null0_export_ButtonUp.call(void, button)

proc null_sound_mix*(): pointer = 
  Soloud_mixSigned16(null0_sound, aBuffer, cuint SAMPLES_PER_FRAME)
  return aBuffer

proc cartLoad*(file:FileData) = 
  ## given a (loaded) file-object, load a cart

  if not isWasm(file.data):
    echo "Cart is not valid (wasm bytes.)"
    return

  null0_images[0] = new_image(320, 240)
  null0_fonts[0] = load_default_font()

  null0_sound = Soloud_create()
  discard Soloud_initEx(null0_sound, CLIP_ROUNDOFF, NULLDRIVER, SAMPLE_RATE, 0, 2)
  Soloud_setGlobalVolume(null0_sound, 4.0)
  aBuffer = alloc(uint SAMPLES_PER_FRAME);

  var env = m3_NewEnvironment()
  var runtime = env.m3_NewRuntime(uint16.high.uint32, nil)
  var module: PModule

  checkWasmRes m3_ParseModule(env, module.addr, cast[ptr uint8](file.data), uint32 file.length)
  checkWasmRes m3_LoadModule(runtime, module)
  checkWasmRes m3LinkWasi(module)
  
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
    checkWasmRes m3_LinkRawFunction(module, "*", "load_font_bm", "v(i**)", null0Import_load_font_bmfont)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "load_font_tty", "v(i*ii*)", null0Import_load_font_ttyfont)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "load_font_ttf", "v(i*ii)", null0Import_load_font_ttffont)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "gradient_vertical", "v(iiiii)", null0Import_gradient_vertical)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "gradient_horizontal", "v(iiiii)", null0Import_gradient_horizontal)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "load_speech", "v(i*)", null0Import_load_speech)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "load_sound", "v(i*)", null0Import_load_sound)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "play_sound", "v(i)", null0Import_play_sound)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "image_scale", "v(iiff)", null0Import_image_scale)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "stop_sound", "v(i)", null0Import_stop_sound)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "set_sound_loop", "v(ii)", null0Import_set_sound_loop)
  except WasmError:
    discard
  try:
    checkWasmRes m3_LinkRawFunction(module, "*", "draw_image_rotated", "v(iiiiFFF)", null0Import_draw_image_rotated)
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
  try:
    checkWasmRes m3_FindFunction(null0_export_buttonDown.addr, runtime, "buttonDown")
  except WasmError:
    discard
  try:
    checkWasmRes m3_FindFunction(null0_export_buttonUp.addr, runtime, "buttonUp")
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
    cartLoad(data)
  else:
    if not os.fileExists(filename):
      echo "Could not find " & filename
      return
    
    let l = uint64 os.getFileSize(filename)
    var data = FileData(
      length: l,
      data: cast[ptr UncheckedArray[byte]](alloc(l))
    )
    var f = system.open(filename)
    discard system.readBuffer(f, data.data, data.length)

    if (isWasm(data)):
      cartLoad(data)
    elif isZip(data):
      if not physfs.mountMemory(data.data, int64 data.length, filename, "", true):
        echo "Could not mount " & filename
        return
      if not physfs.exists("main.wasm"):
        echo "No main.wasm in " & filename
        return
      let data = physfs.read("main.wasm")
      cartLoad(data)
    else:
      echo "Invalid cart (not a wasm or zip file.)"
