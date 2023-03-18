var bird:uint8

proc load() {.null0.} =
  echo "Hello from draw."
  bird = load_image("/assets/bird0.png")

proc update() {.null0.} =
  draw_image(bird, 64, 47)

proc unload() {.null0.} =
  echo "Ok, bye."
