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

<cart>       Specify the cart-name (wasm file or zip/directory with main.wasm in it)

Options:
  -h --help  Show this screen.
  -n,--net   Allow cart to access networking
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
  cartLoad(filename)
  cartUpdate()

  # take a screenshot
  pntr.save_image(null0.null0_images[0], "demo.png")

  cartUnload()

when isMainModule:
  main()
