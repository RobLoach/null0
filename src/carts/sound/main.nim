var intro:uint8
var nnn:uint8

proc load*() {.null0.} =
  echo "Hello from sound."
  intro = load_speech("Hello World.")
  nnn = load_sound("/assets/notnullgames.ogg")
  play_sound(intro)

proc buttonDown(button: Button) {.null0.} =
  if button == BUTTON_A:
    play_sound(nnn)

proc unload*() {.null0.} =
  echo "Ok, bye."