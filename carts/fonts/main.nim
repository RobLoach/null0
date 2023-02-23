import ../null0

var bmFont:uint8
var ttyFont:uint8
var ttfFont:uint8

proc load() {.null0.} =
  log("Hello from fonts.")
  bmFont = load_font_bm("assets/bmfont.png", " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/")
  ttyFont = load_font_tty("assets/ttyfont-16x16.png", 16, 16, "\x7f !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~")
  ttfFont = load_font_ttf("assets/tuffy.ttf", 25, DARKPURPLE)

proc update() {.null0.} =
  clear_background(BLACK)
  draw_text("Default Font!", 160, 120)
  draw_text(bmFont, "BM Font example", 100, 100)
  draw_text(ttyFont, "TTY Font example", 10, 10)
  draw_text(ttfFont, "TTF Font example", 200, 0)
  

proc unload() {.null0.} =
  log("Ok, bye.")