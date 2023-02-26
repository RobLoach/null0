proc load() {.null0.} =
  echo "Hello from files."
  var test = readFile("kittens.txt")
  echo test

proc unload() {.null0.} =
  echo "Ok, bye."
