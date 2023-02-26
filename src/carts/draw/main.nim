var logo:uint8
var grad:uint8

proc load() {.null0.} =
  echo "Hello from draw."
  logo = load_image("assets/logo.png")
  grad = gradient_vertical(320, 240, RED, BLUE)

proc update() {.null0.} =
  draw_image(grad, 0, 0)
  draw_circle(160, 120, 100, YELLOW)
  draw_circle(120, 100, 20, BLACK)
  draw_circle(200, 100, 20, BLACK)
  draw_rectangle(110, 150, 100, 20, BLACK)
  draw_image(logo, 64, 47)

proc unload() {.null0.} =
  echo "Ok, bye."
