# not suire if this is needed, but was getting "(invalid data!)" trying to echo
proc getName(button: Button): string = 
  case button:
    of BUTTON_B:
      return "B"
    of BUTTON_Y:
      return "Y"
    of BUTTON_SELECT:
      return "SELECT"
    of BUTTON_START:
      return "START"
    of BUTTON_UP:
      return "UP"
    of BUTTON_DOWN:
      return "DOWN"
    of BUTTON_LEFT:
      return "LEFT"
    of BUTTON_RIGHT:
      return "RIGHT"
    of BUTTON_A:
      return "A"
    of BUTTON_X:
      return "X"
    of BUTTON_L:
      return "L"
    of BUTTON_R:
      return "R"
    of BUTTON_L2:
      return "L2"
    of BUTTON_R2:
      return "R2"
    of BUTTON_L3:
      return "L3"
    of BUTTON_R3:
      return "R3"

proc load() {.null0.} =
  echo "Hello from input."

proc buttonDown(button: Button) {.null0.} =
  echo "down: ", getName(button)

proc buttonUp(button: Button) {.null0.} =
  echo "up: ", getName(button)

proc unload() {.null0.} =
  echo "Ok, bye."