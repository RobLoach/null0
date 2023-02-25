import unittest
import ../src/pntr
import ../src/physfs

suite "Pntr: Gradients":
  test "Horizontal":
    let canvas = pntr.gen_image_gradient_horizontal(320, 240, RED, BLUE)
    pntr.save_image(canvas, "test-gradient-horiz.png")

  test "Vertical":
    let canvas = pntr.gen_image_gradient_vertical(320, 240, RED, BLUE)
    pntr.save_image(canvas, "test-gradient-vert.png")

suite "Pntr: BM Fonts":
  test "from file":
    let font = pntr.load_bmfont("./vendor/pntr/examples/resources/bmfont.png", " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/")
    let canvas = pntr.gen_image_color(320, 240, BLACK)
    pntr.draw_text(canvas, font, "Hello World", 120, 100)
    pntr.save_image(canvas, "test-bm-file.png")

  test "from memory":
    check physfs.init("test")
    check physfs.mount("fonts.null0", "", true)
    var b = physfs.read("/assets/bmfont.png")
    let font = pntr.load_bmfont_from_memory(b.data, cuint b.length, " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/")
    let canvas = pntr.gen_image_color(320, 240, BLACK)
    pntr.draw_text(canvas, font, "Hello World", 120, 100)
    pntr.save_image(canvas, "test-bm-mem.png")
    discard physfs.deinit()

suite "Pntr: TTF Fonts":
  test "from file":
    let font = pntr.load_ttffont("./vendor/pntr/examples/resources/tuffy.ttf", 20, WHITE)
    let canvas = pntr.gen_image_color(320, 240, BLACK)
    pntr.draw_text(canvas, font, "Hello World", 120, 100)
    pntr.save_image(canvas, "test-ttf-file.png")

  # test "TTF from memory":
  #   check init("test")
  #   check mount("fonts.null0", "", true)
  #   var b = read("/assets/tuffy.ttf")
  #   let font = load_ttffont_from_memory(b.data, cuint b.length, 20, WHITE)
  #   let canvas = gen_image_color(320, 240, BLACK)
  #   draw_text(canvas, font, "Hello World", 120, 100)
  #   save_image(canvas, "test-ttf-mem.png")
  #   discard deinit()