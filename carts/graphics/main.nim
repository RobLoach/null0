import ../null0

var logo:uint8

proc load() {.null0.} =
  log("Hello from graphics.")
  logo = load_image("assets/logo.png")

proc update() {.null0.} =
  clear_background(BLACK)
  draw_circle(160, 120, 100, YELLOW)
  draw_circle(120, 100, 20, BLACK)
  draw_circle(200, 100, 20, BLACK)
  draw_rectangle(110, 150, 100, 20, BLACK)
  draw_image(logo, 64, 47)
  draw_text("hello", 160, 120)

proc unload() {.null0.} =
  log("Ok, bye.")
