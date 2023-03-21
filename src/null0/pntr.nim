{.passC: "-Ivendor/".}

{.emit: """
#define PNTR_IMPLEMENTATION
#define PNTR_PIXELFORMAT_ARGB
#define PNTR_ENABLE_DEFAULT_FONT
#define PNTR_ENABLE_TTF
#define PNTR_ENABLE_FILTER_SMOOTH

/*
PNTR_LOAD_FILE macro should match, for easier physfs
unsigned char* pntr_load_file(const char *fileName, unsigned int *bytesRead);
*/

#include "pntr/pntr.h"
""".}

const PNTR_MAX_FONTS* = 256

type
  pntr_image* {.bycopy.} = object
    data*: ptr UncheckedArray[cuint]
    width*: cint
    height*: cint
    pitch*: cint

  pntr_color* {.bycopy.} = object
    b*: uint8
    g*: uint8
    r*: uint8
    a*: uint8
    

  pntr_vector* {.bycopy.} = object
    x*: cint
    y*: cint

  pntr_rectangle* {.bycopy.} = object
    x*: cint
    y*: cint
    width*: cint
    height*: cint
  
  pntr_font* {.bycopy.} = object
    atlas*: ptr pntr_image
    rectangles*: array[PNTR_MAX_FONTS, pntr_rectangle]
    characters*: array[PNTR_MAX_FONTS, char]
    charactersFound*: cint
    glyphBox*: array[PNTR_MAX_FONTS, pntr_rectangle]

  pntr_pixelformat* = enum
    PNTR_PIXELFORMAT_RGBA8888,
    PNTR_PIXELFORMAT_ARGB8888,
    PNTR_PIXELFORMAT_GRAYSCALE
  
  pntr_filter* = enum
    PNTR_FILTER_DEFAULT,
    PNTR_FILTER_NEARESTNEIGHBOR,
    PNTR_FILTER_BILINEAR,
    PNTR_FILTER_SMOOTH

const LIGHTGRAY* = pntr_color(r: 200, g: 200, b: 200, a: 255)
const GRAY* = pntr_color(r: 130, g: 130, b: 130, a: 255)
const DARKGRAY* = pntr_color(r: 80, g: 80, b: 80, a: 255)
const YELLOW* = pntr_color(r: 253, g: 249, b: 0, a: 255  )
const GOLD* = pntr_color(r: 255, g: 203, b: 0, a: 255  )
const ORANGE* = pntr_color(r: 255, g: 161, b: 0, a: 255  )
const PINK* = pntr_color(r: 255, g: 109, b: 194, a: 255)
const RED* = pntr_color(r: 230, g: 41, b: 55, a: 255)
const MAROON* = pntr_color(r: 190, g: 33, b: 55, a: 255)
const GREEN* = pntr_color(r: 0, g: 228, b: 48, a: 255)
const LIME* = pntr_color(r: 0, g: 158, b: 47, a: 255)
const DARKGREEN* = pntr_color(r: 0, g: 117, b: 44, a: 255)
const SKYBLUE* = pntr_color(r: 102, g: 191, b: 255, a: 255)
const BLUE* = pntr_color(r: 0, g: 121, b: 241, a: 255)
const DARKBLUE* = pntr_color(r: 0, g: 82, b: 172, a: 255)
const PURPLE* = pntr_color(r: 200, g: 122, b: 255, a: 255)
const VIOLET* = pntr_color(r: 135, g: 60, b: 190, a: 255)
const DARKPURPLE* = pntr_color(r: 112, g: 31, b: 126, a: 255)
const BEIGE* = pntr_color(r: 211, g: 176, b: 131, a: 255)
const BROWN* = pntr_color(r: 127, g: 106, b: 79, a: 255)
const DARKBROWN* = pntr_color(r: 76, g: 63, b: 47, a: 255)
const WHITE* = pntr_color(r: 255, g: 255, b: 255, a: 255)
const BLACK* = pntr_color(r: 0, g: 0, b: 0, a: 255)
const BLANK* = pntr_color(r: 0, g: 0, b: 0, a: 0  )
const MAGENTA* = pntr_color(r: 255, g: 0, b: 255, a: 255)
const RAYWHITE* = pntr_color(r: 245, g: 245, b: 245, a: 255)

{.push callconv: cdecl, importc:"pntr_$1", discardable.}
proc clear_background*(image: ptr pntr_image; color: pntr_color)
proc color_alpha_blend*(dst: pntr_color; src: pntr_color): pntr_color
proc color_bilinear_interpolate*(color00: pntr_color; color01: pntr_color; color10: pntr_color; color11: pntr_color; coordinateX: cfloat; coordinateY: cfloat): pntr_color
proc color_brightness*(color: pntr_color; factor: cfloat): pntr_color
proc color_contrast*(color: pntr_color; contrast: cfloat): pntr_color
proc color_fade*(color: pntr_color; alpha: cfloat): pntr_color
proc color_get_a*(color: pntr_color): uint8
proc color_get_b*(color: pntr_color): uint8
proc color_get_g*(color: pntr_color): uint8
proc color_get_r*(color: pntr_color): uint8
proc color_invert*(color: pntr_color): pntr_color
proc color_set_a*(color: ptr pntr_color; a: uint8)
proc color_set_b*(color: ptr pntr_color; b: uint8)
proc color_set_g*(color: ptr pntr_color; g: uint8)
proc color_set_r*(color: ptr pntr_color; r: uint8)
proc color_tint*(color: pntr_color; tint: pntr_color): pntr_color
proc draw_circle*(dst: ptr pntr_image; centerX: cint; centerY: cint; radius: cint; color: pntr_color)
proc draw_image*(dst: ptr pntr_image; src: ptr pntr_image; posX: cint; posY: cint)
proc draw_image_flipped*(dst: ptr pntr_image; src: ptr pntr_image; posX: cint; posY: cint; flipHorizontal: bool; flipVertical: bool)
proc draw_image_rec*(dst: ptr pntr_image; src: ptr pntr_image; srcRect: pntr_rectangle; posX: cint; posY: cint)
proc draw_image_rec_flipped*(dst: ptr pntr_image; src: ptr pntr_image; srcRec: pntr_rectangle; posX: cint; posY: cint; flipHorizontal: bool; flipVertical: bool)
proc draw_image_rec_rotated*(dst: ptr pntr_image; src: ptr pntr_image; srcRect: pntr_rectangle; posX: cint; posY: cint; rotation: cfloat; offsetX: cfloat; offsetY: cfloat; filter: pntr_filter)
proc draw_image_rec_scaled*(dst: ptr pntr_image; src: ptr pntr_image; srcRect: pntr_rectangle; posX: cint; posY: cint; scaleX: cfloat; scaleY: cfloat; offsetX: cfloat; offsetY: cfloat; filter: pntr_filter)
proc draw_image_rotated*(dst: ptr pntr_image; src: ptr pntr_image; posX: cint; posY: cint; rotation: cfloat; offsetX: cfloat; offsetY: cfloat; filter: pntr_filter)
proc draw_image_scaled*(dst: ptr pntr_image; src: ptr pntr_image; posX: cint; posY: cint; scaleX: cfloat; scaleY: cfloat; offsetX: cfloat; offsetY: cfloat; filter: pntr_filter)
proc draw_line*(dst: ptr pntr_image; startPosX: cint; startPosY: cint; endPosX: cint; endPosY: cint; color: pntr_color)
proc draw_pixel*(dst: ptr pntr_image; x: cint; y: cint; color: pntr_color)
proc draw_rectangle*(dst: ptr pntr_image; posX: cint; posY: cint; width: cint; height: cint; color: pntr_color)
proc draw_rectangle_rec*(dst: ptr pntr_image; rect: pntr_rectangle; color: pntr_color)
proc draw_text*(dst: ptr pntr_image; font: ptr pntr_font; text: cstring; posX: cint; posY: cint)
proc font_copy*(font: ptr pntr_font): ptr pntr_font
proc font_scale*(font: ptr pntr_font; scaleX: cfloat; scaleY: cfloat; filter: pntr_filter): ptr pntr_font
proc gen_image_color*(width: cint; height: cint; color: pntr_color): ptr pntr_image
proc gen_image_gradient*(width: cint; height: cint; topLeft: pntr_color; topRight: pntr_color; bottomLeft: pntr_color; bottomRight: pntr_color): ptr pntr_image
proc gen_image_gradient_horizontal*(width: cint; height: cint; left: pntr_color; right: pntr_color): ptr pntr_image
proc gen_image_gradient_vertical*(width: cint; height: cint; top: pntr_color; bottom: pntr_color): ptr pntr_image
proc gen_image_text*(font: ptr pntr_font; text: cstring): ptr pntr_image
proc get_color*(hexValue: cuint): pntr_color
proc get_error*(): cstring
proc get_pixel_color*(srcPtr: pointer; srcPixelFormat: pntr_pixelformat): pntr_color
proc get_pixel_data_size*(width: cint; height: cint; pixelFormat: pntr_pixelformat): cint
proc image_alpha_border*(image: ptr pntr_image; threshold: cfloat): pntr_rectangle
proc image_alpha_crop*(image: ptr pntr_image; threshold: cfloat)
proc image_alpha_mask*(image: ptr pntr_image; alphaMask: ptr pntr_image; posX: cint; posY: cint)
proc image_color_brightness*(image: ptr pntr_image; factor: cfloat)
proc image_color_contrast*(image: ptr pntr_image; contrast: cfloat)
proc image_color_fade*(image: ptr pntr_image; alpha: cfloat)
proc image_color_invert*(image: ptr pntr_image)
proc image_color_replace*(image: ptr pntr_image; color: pntr_color; replace: pntr_color)
proc image_color_tint*(image: ptr pntr_image; color: pntr_color)
proc image_copy*(image: ptr pntr_image): ptr pntr_image
proc image_crop*(image: ptr pntr_image; x: cint; y: cint; width: cint; height: cint)
proc image_flip_horizontal*(image: ptr pntr_image)
proc image_flip_vertical*(image: ptr pntr_image)
proc image_from_image*(image: ptr pntr_image; x: cint; y: cint; width: cint; height: cint): ptr pntr_image
proc image_from_pixelformat*(data: pointer; width: cint; height: cint; pixelFormat: pntr_pixelformat): ptr pntr_image
proc image_get_color*(image: ptr pntr_image; x: cint; y: cint): pntr_color
proc image_get_color_pointer*(image: ptr pntr_image; x: cint; y: cint): ptr pntr_color
proc image_resize*(image: ptr pntr_image; newWidth: cint; newHeight: cint; filter: pntr_filter): ptr pntr_image
proc image_resize_canvas*(image: ptr pntr_image; newWidth: cint; newHeight: cint; offsetX: cint; offsetY: cint; fill: pntr_color)
proc image_rotate*(image: ptr pntr_image; rotation: cfloat; filter: pntr_filter): ptr pntr_image
proc image_scale*(image: ptr pntr_image; scaleX: cfloat; scaleY: cfloat; filter: pntr_filter): ptr pntr_image
proc image_to_pixelformat*(image: ptr pntr_image; dataSize: ptr cuint; pixelFormat: pntr_pixelformat): pointer
proc load_bmfont*(fileName: cstring; characters: cstring): ptr pntr_font
proc load_bmfont_from_image*(image: ptr pntr_image; characters: cstring): ptr pntr_font
proc load_bmfont_from_memory*(fileData: pointer; dataSize: cuint; characters: cstring): ptr pntr_font
proc load_default_font*(): ptr pntr_font
proc load_file*(fileName: cstring; bytesRead: ptr cuint): pointer
proc load_image*(fileName: cstring): ptr pntr_image
proc load_image_from_memory*(fileData: pointer; dataSize: cuint): ptr pntr_image
proc load_ttffont*(fileName: cstring; fontSize: cint; fontColor: pntr_color): ptr pntr_font
proc load_ttffont_from_memory*(fileData: pointer; dataSize: cuint; fontSize: cint; fontColor: pntr_color): ptr pntr_font
proc load_ttyfont*(fileName: cstring; glyphWidth: cint; glyphHeight: cint; characters: cstring): ptr pntr_font
proc load_ttyfont_from_image*(image: ptr pntr_image; glyphWidth: cint; glyphHeight: cint; characters: cstring): ptr pntr_font
proc load_ttyfont_from_memory*(fileData: pointer; dataSize: cuint; glyphWidth: cint; glyphHeight: cint; characters: cstring): ptr pntr_font
proc measure_text*(font: ptr pntr_font; text: cstring): cint
proc measure_text_ex*(font: ptr pntr_font; text: cstring): pntr_vector
proc new_color*(r: uint8; g: uint8; b: uint8; a: uint8): pntr_color
proc new_image*(width: cint; height: cint): ptr pntr_image
proc save_file*(fileName: cstring; data: pointer; bytesToWrite: cuint): bool
proc save_image*(image: ptr pntr_image; fileName: cstring): bool
proc save_image_to_memory*(image: ptr pntr_image; dataSize: ptr cuint): pointer
proc set_error*(error: cstring): pointer
proc set_pixel_color*(dstPtr: pointer; color: pntr_color; dstPixelFormat: pntr_pixelformat)
proc unload_file*(fileData: pointer)
proc unload_font*(font: ptr pntr_font)
proc unload_image*(image: ptr pntr_image)
{.pop.}