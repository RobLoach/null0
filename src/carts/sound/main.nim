var intro:uint8
var nnn:uint8

proc load*() {.null0.} =
  echo "Hello from sound."
  intro = load_speech("Hello World.")
  nnn = load_sound("/assets/notnullgames.ogg")
  
proc update() {.null0.} =
  draw_text("Press A / B", 100, 110)

proc buttonDown(button: Button) {.null0.} =
  if button == BUTTON_A:
    play_sound(intro)
  if button == BUTTON_B:
    play_sound(nnn)

proc unload*() {.null0.} =
  echo "Ok, bye."