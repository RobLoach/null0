import std/strutils

var land: uint8
var logo: uint8
var pipe_bottom: uint8
var pipe_top: uint8
var sky: uint8
import std/math
import strformat

var bird:array[3, uint8]

var font_bignumbers: uint8
var font_pixel_18x16: uint8

var die: uint8
var hit: uint8
var music1: uint8
var music2: uint8
var music3: uint8
var point: uint8
var swooshing: uint8
var wing: uint8

type GameState = enum
  STATE_INTRO,
  STATE_PLAY,
  STATE_END

var state = STATE_INTRO
var score:float = 0

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
  font_bignumbers = load_font_tty("assets/font_bignumbers.png", 24, 36, "0123456789 ")

  die = load_sound("assets/sounds/die.ogg")
  hit = load_sound("assets/sounds/hit.ogg")
  point = load_sound("assets/sounds/point.ogg")
  swooshing = load_sound("assets/sounds/swooshing.ogg")
  wing = load_sound("assets/sounds/wing.ogg")

  music1 = load_sound("assets/sounds/music1.ogg")
  music2 = load_sound("assets/sounds/music2.ogg")
  music3 = load_sound("assets/sounds/music3.ogg")
  play_sound(music1)
  

proc buttonDown(button: Button) {.null0.} =
  if button == BUTTON_A:
    if state == STATE_END:
      state = STATE_INTRO
      stop_sound(music3)
      play_sound(music1)
      return
    
    if state == STATE_PLAY:
      state = STATE_END
      stop_sound(music2)
      play_sound(music3)
      return
    
    if state == STATE_INTRO:
      state = STATE_PLAY
      score = 0
      stop_sound(music1)
      play_sound(music2)
      return

proc update(dt: uint) {.null0.} =
  let landx = 336 - (int(int(dt)/10) mod 336)
  draw_image(sky, 0, 0)

  if state == STATE_INTRO:
    let s = sin(float (int(dt)/200))
    let f = int(int(dt) / 100) mod 3
    draw_image(pipe_top , landx-50, -450)
    draw_image(pipe_bottom , landx-50, 160)
    draw_image(bird[f], 150 , int(s * 30) + 100)
    draw_image(logo, 70, 80)
    draw_text(font_pixel_18x16, "IN NULL0", 90, 140)

  if state == STATE_PLAY:
    # fake score increment
    score += int(dt)/200000

    let s = sin(float (int(dt)/200))
    let f = int(int(dt) / 100) mod 3
    draw_image(pipe_top , landx-50, -450)
    draw_image(pipe_bottom , landx-50, 160)
    draw_image(bird[f], 150 , int(s * 30) + 100)
    draw_text(font_pixel_18x16, $int(score), 0, 0)
  
  if state == STATE_END:
    draw_text(font_pixel_18x16, "YOU DIED", 90, 140)
    draw_text(font_bignumbers, center($int(score), 14), 0, 80)
  
  draw_image(land, landx, 200)
  draw_image(land, landx - 336, 200)
