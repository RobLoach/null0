var buttonState:array[0..15, bool]
var buttonImages:array[0..15, uint8]
var bg:uint8
var grad:uint8

proc load() {.null0.} =
  echo "Hello from input."
  bg = load_image("assets/bg.png")
  grad = gradient_vertical(320, 240, GREEN, BLUE)
  buttonImages[ord BUTTON_B] = load_image("assets/b.png")
  buttonImages[ord BUTTON_Y] = load_image("assets/y.png")
  buttonImages[ord BUTTON_SELECT] = load_image("assets/select.png")
  buttonImages[ord BUTTON_START] = load_image("assets/start.png")
  buttonImages[ord BUTTON_UP] = load_image("assets/up.png")
  buttonImages[ord BUTTON_DOWN] = load_image("assets/down.png")
  buttonImages[ord BUTTON_LEFT] = load_image("assets/left.png")
  buttonImages[ord BUTTON_RIGHT] = load_image("assets/right.png")
  buttonImages[ord BUTTON_A] = load_image("assets/a.png")
  buttonImages[ord BUTTON_X] = load_image("assets/x.png")
  buttonImages[ord BUTTON_L] = load_image("assets/l1.png")
  buttonImages[ord BUTTON_R] = load_image("assets/r1.png")

  # I wasn't sure how to draw these in 2D, so I just merged them into L/R
  buttonImages[ord BUTTON_L2] = load_image("assets/l1.png")
  buttonImages[ord BUTTON_R2] = load_image("assets/r1.png")
  buttonImages[ord BUTTON_L3] = load_image("assets/l1.png")
  buttonImages[ord BUTTON_R3] = load_image("assets/r1.png")

proc buttonDown(button: Button) {.null0.} =
  buttonState[ord button] = true

proc buttonUp(button: Button) {.null0.} =
  buttonState[ord button] = false

proc update() {.null0.} =
  draw_image(grad, 0, 0)
  draw_image(bg, 0, 50)
  for b, state in pairs(buttonState):
    if state:
      draw_image(buttonImages[b], 0, 3)

proc unload() {.null0.} =
  echo "Ok, bye."