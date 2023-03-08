var intro:uint8

proc load*() {.null0.} =
  echo "Hello from sound."
  intro = load_speech("Hello World.")
  play_sound(intro)

proc unload*() {.null0.} =
  echo "Ok, bye."