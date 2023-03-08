import unittest
import ../src/null0/pntr
import ../src/null0/physfs

suite "Pntr: Gradients":
  test "horizontal":
    let canvas = pntr.gen_image_gradient_horizontal(320, 240, RED, BLUE)
    defer: pntr.unload_image(canvas)

    pntr.save_image(canvas, "test-gradient-horiz.png")

  test "vertical":
    let canvas = pntr.gen_image_gradient_vertical(320, 240, RED, BLUE)
    defer: pntr.unload_image(canvas)

    pntr.save_image(canvas, "test-gradient-vert.png")

suite "Pntr: BM Fonts":
  test "from file":
    let font = pntr.load_bmfont("./vendor/pntr/examples/resources/bmfont.png", " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/")
    defer: pntr.unload_font(font)

    let canvas = pntr.gen_image_color(320, 240, BLACK)
    defer: pntr.unload_image(canvas)

    pntr.draw_text(canvas, font, "Hello World", 120, 100)
    pntr.save_image(canvas, "test-bm-file.png")

  test "from physfs":
    check physfs.init("test")
    defer: discard physfs.deinit()

    check physfs.mount("fonts.null0", "", true)
    var b = physfs.read("/assets/bmfont.png")
    let font = pntr.load_bmfont_from_memory(b.data, cuint b.length, " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/")
    defer: pntr.unload_font(font)

    let canvas = pntr.gen_image_color(320, 240, BLACK)
    defer: pntr.unload_image(canvas)

    pntr.draw_text(canvas, font, "Hello World", 120, 100)
    pntr.save_image(canvas, "test-bm-mem.png")

suite "Pntr: TTF Fonts":
  test "from file":
    let font = pntr.load_ttffont("./vendor/pntr/examples/resources/tuffy.ttf", 20, WHITE)
    defer: pntr.unload_font(font)

    let canvas = pntr.gen_image_color(320, 240, BLACK)
    defer: pntr.unload_image(canvas)

    pntr.draw_text(canvas, font, "Hello World", 120, 100)
    pntr.save_image(canvas, "test-ttf-file.png")

  test "from physfs":
    check init("test")
    defer: discard physfs.deinit()

    check mount("fonts.null0", "", true)
    var b = read("/assets/tuffy.ttf")
    let font = load_ttffont_from_memory(b.data, cuint b.length, 20, WHITE)
    defer: pntr.unload_font(font)

    let canvas = gen_image_color(320, 240, BLACK)
    defer: pntr.unload_image(canvas)

    draw_text(canvas, font, "Hello World", 120, 100)
    save_image(canvas, "test-ttf-mem.png")