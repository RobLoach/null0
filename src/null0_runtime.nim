import std/os
import docopt

import null0/null0
import null0/physfs
import null0/pntr

const doc = """
null0 - Runtime for null0 game-engine

Usage:
  null0 <cart>
  null0 --help
  null0 --net <cart>
  null0 --out=<image> <cart>

<cart>       Specify the cart-name (wasm file or zip/directory with main.wasm in it)

Options:
  -h --help     Show this screen.
  -n,--net      Allow cart to access networking
  --out=<image> Currently, it just outputs image. You can set the filename here (defaults to demo.png)
"""
proc main() =
  let args = docopt(doc, version = "0.0.1")
  let filename = $args["<cart>"]

  if args["--net"]:
    null0.allowNetwork = true
    echo "allowing network"

  if not physfs.init(filename):
    echo "Could not init filesystem."
    return
  
  try:
    cartLoad(filename)
    cartUpdate()

    # take a screenshot
    var outname = "demo.png"
    if args["--out"]:
      outname = expandTilde($args["--out"])
    pntr.save_image(null0.null0_images[0], outname)

    cartUnload()
  except:
    discard

when isMainModule:
  main()
