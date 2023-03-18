var intro:uint8
var notnullgames:uint8
var forgotten_spaceship:uint8

proc load*() {.null0.} =
  echo "Hello from sound."
  intro = load_speech("Hello World.")
  notnullgames = load_sound("/assets/notnullgames.ogg")
  forgotten_spaceship = load_sound("/assets/forgotten_spaceship.ogg")
  play_sound(forgotten_spaceship)
  
proc update() {.null0.} =
  draw_text("Press A / B", 100, 110)

proc buttonDown(button: Button) {.null0.} =
  if button == BUTTON_A:
    play_sound(intro)
  if button == BUTTON_B:
    play_sound(notnullgames)

proc unload*() {.null0.} =
  echo "Ok, bye."