import ../null0

proc load() {.null0.} =
  echo "Hello from input."

proc update() {.null0.} =
  discard

proc buttonDown(button: Button) {.null0.} =
  echo "down: ", button

proc buttonUp(button: Button) {.null0.} =
  echo "up: ", button

proc unload() {.null0.} =
  echo "Ok, bye."