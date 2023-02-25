import unittest
import wasm3
import wasm3/wasm3c
import ../src/null0_lib
import ../src/physfs
import ../src/pntr

suite "Physfs":
  test "mount zip file and read from it using read()":
    check init("test")
    check mount("draw.null0", "", true)
    var b = read("assets/logo.png")
    var l = fileLength("assets/logo.png")
    check l == 9211
    discard deinit()

suite "Pntr":
  test "Gradient: Horizontal":
    let canvas = gen_image_gradient_horizontal(320, 240, RED, BLUE)
    save_image(canvas, "test-gradient-horiz.png")

  test "Gradient: Vertical":
    let canvas = gen_image_gradient_vertical(320, 240, RED, BLUE)
    save_image(canvas, "test-gradient-vert.png")

  test "BM Font from file":
    let font = load_bmfont("./carts/fonts/assets/bmfont.png", " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/")
    let canvas = gen_image_color(320, 240, BLACK)
    draw_text(canvas, font, "Hello World", 120, 100)
    save_image(canvas, "test-bm-file.png")

  test "BM Font from memory":
    check init("test")
    check mount("fonts.null0", "", true)
    var b = read("/assets/bmfont.png")
    let font = load_bmfont_from_memory(b.data, cuint b.length, " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/")
    let canvas = gen_image_color(320, 240, BLACK)
    draw_text(canvas, font, "Hello World", 120, 100)
    save_image(canvas, "test-bm-mem.png")
    discard deinit()

  # test "TTF from file":
  #   let font = load_ttffont("./vendor/pntr/examples/resources/tuffy.ttf", 20, WHITE)
  #   let canvas = gen_image_color(320, 240, BLACK)
  #   draw_text(canvas, font, "Hello World", 120, 100)
  #   save_image(canvas, "test-ttf-file.png")

  # test "TTF from memory":
  #   check init("test")
  #   check mount("fonts.null0", "", true)
  #   var b = read("/assets/tuffy.ttf")
  #   let font = load_ttffont_from_memory(b.data, cuint b.length, 20, WHITE)
  #   let canvas = gen_image_color(320, 240, BLACK)
  #   draw_text(canvas, font, "Hello World", 120, 100)
  #   save_image(canvas, "test-ttf-mem.png")
  #   discard deinit()


suite "Cart Utils":
  test "isZip":
    let w = readFile("justlog.wasm")
    let z = readFile("justlog.null0")
    check isZip(z)
    check isZip(w) != true
  
  test "isWasm":
    let w = readFile("justlog.wasm")
    let z = readFile("justlog.null0")
    check isWasm(w)
    check isWasm(z) != true

  test "isWasm in zip":
    check init("test")
    check mount("draw.null0", "", true)
    var b = read("main.wasm")
    check isWasm(b)
    discard deinit()

suite "wasm (justlog)":
  test "Setup log hook function and call it":
    proc logProc(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
      var sp = sp.stackPtrToUint()
      extractAs(msg, cstring, sp, mem)
      echo msg
    let env = loadWasmEnv(readFile("justlog.wasm"), hostProcs = [
      wasmHostProc("*", "null0_log", "v(i)", logProc)
    ])
    let cart_export_load = env.findFunction("load", [], [])
    cart_export_load.call(void)

  test "Setup log hook function and call it, when it doesn't exist":
    proc logProc(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
      var sp = sp.stackPtrToUint()
      extractAs(msg, cstring, sp, mem)
      echo msg
    let env = loadWasmEnv(readFile("justlog.wasm"), hostProcs = [
      wasmHostProc("*", "null0_log", "v(i)", logProc)
    ])
    try:
      let cart_export_load = env.findFunction("loadbad", [], [])
      cart_export_load.call(void)
    except WasmError as e:
      echo "more chill error: ", e.msg

  test "Setup log hook function and call it, using callHost":
    proc logProc(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
      proc logProcImpl(c: cstring) =
        echo c
      var sp = sp.stackPtrToUint()
      callHost(logProcImpl, sp, mem)
    let env = loadWasmEnv(readFile("justlog.wasm"), hostProcs = [
      wasmHostProc("*", "null0_log", "v(i)", logProc)
    ])
    env.findFunction("load", [], []).call(void)







