import ../null0

proc load*() {.null0.} =
  log("Hello from graphics.")

proc update*() {.null0.} =
  clear_background(BLACK)
  draw_circle(160, 120, 100, RED)
  draw_circle(120, 100, 20, BLACK)
  draw_circle(200, 100, 20, BLACK)
  draw_rectangle(110, 150, 100, 20, BLACK)

proc unload*() {.null0.} =
  log("Ok, bye.")
