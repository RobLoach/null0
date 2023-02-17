import print

type
  RetroGameGeometry {.bycopy.} = object
    baseWidth: cuint
    baseHeight: cuint
    maxWidth: cuint
    maxHeight: cuint
    aspectRatio: cfloat

  RetroSystemTiming {.bycopy.} = object
    fps: cdouble
    sampleRate: cdouble

  RetroSystemAvInfo {.bycopy.} = object
    geometry: RetroGameGeometry
    timing: RetroSystemTiming

  RetroSystemInfo* {.bycopy.} = object
    libraryName*: cstring
    libraryVersion*: cstring
    validExtensions*: cstring
    needFullpath: bool
    blockExtract: bool
  
  RetroGameInfo {.bycopy.} = object
    path: cstring
    data: pointer
    size: csize_t
    meta: cstring

  # typedef void(RETRO_CALLCONV* retro_video_refresh_t)(const void* data, unsigned width, unsigned height, size_t pitch);
  retro_video_refresh_t = (proc(data:array[307200, byte], width:cuint, height:cuint, pitch:csize_t):void) # 320 * 240 * 4

  # typedef void(RETRO_CALLCONV* retro_audio_sample_t)(int16_t left, int16_t right);
  retro_audio_sample_t = (proc(left:int16, right:int16):void)

  # typedef size_t(RETRO_CALLCONV* retro_audio_sample_batch_t)(const int16_t* data, size_t frames);
  retro_audio_sample_batch_t = (proc(data:array[800, int16], frames:csize_t):csize_t) # 48000/60

  # typedef void(RETRO_CALLCONV* retro_input_poll_t)(void);
  retro_input_poll_t = (proc():void)

  # typedef bool(RETRO_CALLCONV* retro_environment_t)(unsigned cmd, void* data);
  retro_environment_t = (proc(cmd:cuint, data:pointer):bool)
  
  # typedef int16_t(RETRO_CALLCONV* retro_input_state_t)(unsigned port, unsigned device, unsigned index, unsigned id);
  retro_input_state_t = (proc(port:cuint, device:cuint, index:cuint, id:cuint):int16)

var video_cb: retro_video_refresh_t
var audio_cb: retro_audio_sample_t
var audio_batch_cb: retro_audio_sample_batch_t
var input_poll_cb: retro_input_poll_t
var environ_cb: retro_environment_t
var input_state_cb: retro_input_state_t

# TODO: these currently segfault

proc retro_set_video_refresh*(cb: retro_video_refresh_t) {.cdecl,exportc,dynlib.} =
  video_cb = cb

proc retro_set_audio_sample*(cb: retro_audio_sample_t) {.cdecl,exportc,dynlib.} =
  audio_cb = cb

proc retro_set_audio_sample_batch*(cb: retro_audio_sample_batch_t) {.cdecl,exportc,dynlib.} =
  audio_batch_cb = cb

proc retro_set_input_poll*(cb: retro_input_poll_t) {.cdecl,exportc,dynlib.} =
  input_poll_cb = cb

proc retro_set_environment*(cb: retro_environment_t) {.cdecl,exportc,dynlib.} =
  environ_cb = cb

proc retro_set_input_state*(cb: retro_input_state_t) {.cdecl,exportc,dynlib.} =
  input_state_cb = cb



proc retro_init*() {.cdecl,exportc,dynlib.} =
  echo "retro_init"

proc retro_deinit*() {.cdecl,exportc,dynlib.} =
  echo "retro_deinit"

proc retro_api_version*(): cuint {.cdecl,exportc,dynlib.} =
  return 1

proc retro_set_controller_port_device*(port: cuint; device: cuint) {.cdecl,exportc,dynlib.} =
  echo "retro_set_controller_port_device"
  echo port, device

proc retro_get_system_info*(info: ptr RetroSystemInfo) {.cdecl,exportc,dynlib.} =
  info.library_name = "null0";
  info.library_version = "v1"
  info.need_fullpath = true
  info.valid_extensions = "null0|wasm|zip"

proc retro_get_system_av_info*(info: ptr RetroSystemAvInfo) {.cdecl,exportc,dynlib.} =
  echo "retro_get_system_av_info"
  info.timing.fps = 60
  info.timing.sample_rate = 48000
  info.geometry.base_width = 320
  info.geometry.base_height = 240
  info.geometry.max_width = 320
  info.geometry.max_height = 240
  info.geometry.aspect_ratio = 4 / 3

proc retro_reset*() {.cdecl,exportc,dynlib.} =
  echo "retro_reset"

proc retro_run*() {.cdecl,exportc,dynlib.} =
  echo "retro_run"

proc retro_load_game*(info: ptr RetroGameInfo): bool {.cdecl,exportc,dynlib.} =
  echo "retro_load_game"
  print(info)
  return true

proc retro_unload_game*() {.cdecl,exportc,dynlib.} =
  echo "retro_unload_game"

proc retro_get_region*(): cuint {.cdecl,exportc,dynlib.} =
  return 0 # NTSC

proc retro_load_game_special*(`type`: cuint; info: ptr RetroGameInfo; num: csize_t): bool {.cdecl,exportc,dynlib.} =
  return true

proc retro_serialize_size*(): csize_t {.cdecl,exportc,dynlib.} =
  return 0

proc retro_serialize*(data: pointer; size: csize_t): bool {.cdecl,exportc,dynlib.} =
  return true

proc retro_unserialize*(data: pointer; size: csize_t): bool {.cdecl,exportc,dynlib.} =
  return true

proc retro_get_memory_data*(id: cuint): pointer {.cdecl,exportc,dynlib.} =
  discard

proc retro_get_memory_size*(id: cuint): csize_t {.cdecl,exportc,dynlib.} =
  return 0

proc retro_cheat_reset*() {.cdecl,exportc,dynlib.} =
  discard

proc retro_cheat_set*(index: cuint; enabled: bool; code: cstring) {.cdecl,exportc,dynlib.} =
  discard
