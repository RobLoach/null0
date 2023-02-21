# this is the nim-header for making games

import std/[macros]

macro null0*(t: typed): untyped =
  if t.kind notin {nnkProcDef, nnkFuncDef}:
    error("Can only export procedures", t)
  let
    newProc = copyNimTree(t)
    codeGen = nnkExprColonExpr.newTree(ident"codegendecl", newLit"EMSCRIPTEN_KEEPALIVE $# $#$#")
  if newProc[4].kind == nnkEmpty:
    newProc[4] = nnkPragma.newTree(codeGen)
  else:
    newProc[4].add codeGen
  newProc[4].add ident"exportC"
  result = newStmtList()
  result.add:
    quote do:
      {.emit: "/*INCLUDESECTION*/\n#include <emscripten.h>".}
  result.add:
    newProc

template exportVar*(name: untyped, typ: typedesc) =
  var name {.exportC, codegendecl:"$# EMSCRIPTEN_KEEPALIVE $#".}: typ

type
  Color* {.byref,packed.} = object
    b*: uint8
    g*: uint8
    r*: uint8
    a*: uint8

var currentImage* = 0

proc log*(s: cstring){.importc:"null0_log", cdecl.}

proc clear_background*(dst: uint8, color: Color){.importc, cdecl.}
proc clear_background*(color: Color) =
  clear_background(uint8 0, color)

proc draw_circle*(dst: uint8, centerX: int, centerY: int, radius:int, color: Color){.importc, cdecl.}
proc draw_circle*(centerX: int, centerY: int, radius:int, color: Color) =
  draw_circle(uint8 0, centerX, centerY, radius, color)

proc draw_pixel*(dst: uint8, x: cint, y: cint, color: Color){.importc, cdecl.}
proc draw_pixel*(x: int; y: int; color: Color) =
  draw_pixel(uint8 0, cint x, cint y, color)

proc draw_line*(dst: uint8, startPosX: cint, startPosY: cint, endPosX: cint, endPosY: cint, color: Color){.importc, cdecl.}
proc draw_line*(startPosX: int, startPosY: int, endPosX: int, endPosY: int, color: Color) =
  draw_line(uint8 0, cint startPosX, cint startPosY, cint endPosX, cint endPosY, color)

proc draw_rectangle*(dst: uint8, posX: cint, posY: cint, width: cint, height: cint, color: Color){.importc, cdecl.}
proc draw_rectangle*(posX: int, posY: int, width: int, height: int, color: Color) =
  draw_rectangle(0, cint posX, cint posY, cint width, cint height, color)

proc load_image*(destination: uint8, filename: cstring){.importc, cdecl.}
proc load_image*(filename: string): uint8 = 
  currentImage = currentImage + 1
  load_image(uint8 currentImage, filename)
  return uint8 currentImage

proc draw_image*(dst: uint8, src: uint8, posX: cint, posY: cint){.importc, cdecl.}
proc draw_image*(src: uint8, posX: int, posY: int) =
  draw_image(uint8 0, src, cint posX, cint posY)


const LIGHTGRAY* = Color(r: 200, g: 200, b: 200, a: 255)
const GRAY* = Color(r: 130, g: 130, b: 130, a: 255)
const DARKGRAY* = Color(r: 80, g: 80, b: 80, a: 255)
const YELLOW* = Color(r: 253, g: 249, b: 0, a: 255  )
const GOLD* = Color(r: 255, g: 203, b: 0, a: 255  )
const ORANGE* = Color(r: 255, g: 161, b: 0, a: 255  )
const PINK* = Color(r: 255, g: 109, b: 194, a: 255)
const RED* = Color(r: 230, g: 41, b: 55, a: 255)
const MAROON* = Color(r: 190, g: 33, b: 55, a: 255)
const GREEN* = Color(r: 0, g: 228, b: 48, a: 255)
const LIME* = Color(r: 0, g: 158, b: 47, a: 255)
const DARKGREEN* = Color(r: 0, g: 117, b: 44, a: 255)
const SKYBLUE* = Color(r: 102, g: 191, b: 255, a: 255)
const BLUE* = Color(r: 0, g: 121, b: 241, a: 255)
const DARKBLUE* = Color(r: 0, g: 82, b: 172, a: 255)
const PURPLE* = Color(r: 200, g: 122, b: 255, a: 255)
const VIOLET* = Color(r: 135, g: 60, b: 190, a: 255)
const DARKPURPLE* = Color(r: 112, g: 31, b: 126, a: 255)
const BEIGE* = Color(r: 211, g: 176, b: 131, a: 255)
const BROWN* = Color(r: 127, g: 106, b: 79, a: 255)
const DARKBROWN* = Color(r: 76, g: 63, b: 47, a: 255)
const WHITE* = Color(r: 255, g: 255, b: 255, a: 255)
const BLACK* = Color(r: 0, g: 0, b: 0, a: 255)
const BLANK* = Color(r: 0, g: 0, b: 0, a: 0  )
const MAGENTA* = Color(r: 255, g: 0, b: 255, a: 255)
const RAYWHITE* = Color(r: 245, g: 245, b: 245, a: 255)
