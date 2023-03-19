var land: uint8
var logo: uint8
var pipe_bottom: uint8
var pipe_top: uint8
var sky: uint8
import std/math

var bird:array[3, uint8]

var font_bignumbers: uint8
var font_pixel_18x16: uint8

proc load() {.null0.} =
  bird[0] = load_image("assets/bird0.png")
  bird[1] = load_image("assets/bird1.png")
  bird[2] = load_image("assets/bird2.png")
  land = load_image("assets/land.png")
  logo = image_scale(load_image("assets/logo.png"), 0.5)
  pipe_bottom = load_image("assets/pipe-bottom.png")
  pipe_top = load_image("assets/pipe-top.png")
  sky = image_scale(load_image("assets/sky.png"), 2.0)

  font_pixel_18x16 = load_font_tty("assets/font_pixel-18x16.png", 18, 16, " !*+,-./0123\"456789:;<=#>?@ABCDEFG$HIJKLMNOPQ%RSTUVWXYZ[&\\]^_`'(){|}~")
  font_bignumbers = load_font_tty("assets/font_bignumbers.png", 24, 36, "0123456789")

proc update(dt: uint) {.null0.} =
  let s = sin(float (int(dt)/200))
  let f = int(int(dt) / 100) mod 3
  let landx = 336 - (int(int(dt)/10) mod 336)
  draw_image(sky, 0, 0)
  draw_image(pipe_top , landx-50, -400)
  draw_image(pipe_bottom , landx-50, 150)
  draw_image(land, landx, 200)
  draw_image(land, landx - 336, 200)
  draw_image(bird[f], 150 , int(s * 50) + 100)
  draw_image(logo, 70, 80)
  draw_text(font_pixel_18x16, "IN NULL0", 90, 140)
