import ../null0

proc load*() {.wasmexport.} =
  log("Hello from graphics.")

proc update*() {.wasmexport.} =
  clear_background(BLACK)
  draw_circle(160, 120, 100, RED)
  draw_circle(120, 100, 20, BLACK)
  draw_circle(200, 100, 20, BLACK)
  draw_rectangle(110, 150, 100, 20, BLACK)

proc unload*() {.wasmexport.} =
  log("Ok, bye.")
