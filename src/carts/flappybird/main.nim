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
  logo = load_image("assets/logo.png")
  pipe_bottom = load_image("assets/pipe-bottom.png")
  pipe_top = load_image("assets/pipe-top.png")
  sky = image_scale(load_image("assets/sky.png"), 2.0)

  font_pixel_18x16 = load_font_tty("assets/font_pixel-18x16.png", 18, 16, " !*+,-./0123\"456789:;<=#>?@ABCDEFG$HIJKLMNOPQ%RSTUVWXYZ[&\\]^_`'(){|}~")
  font_bignumbers = load_font_tty("assets/font_bignumbers.png", 24, 36, "0123456789")

proc update(dt: uint) {.null0.} =
  let s = sin(float (int(dt)/100))
  draw_image(sky, 0, 0)
  draw_image(land, 0, 200)
  draw_text(font_pixel_18x16, "FLAPPYBIRD", 80, 20)
  draw_image(bird[0], int(s * 50) + 150 , int(s * 50) + 100)
  # draw_text(font_bignumbers, $(int(dt)), 10, 20)


