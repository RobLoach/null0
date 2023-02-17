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

  cbvideo_t = (proc(data:array[307200, byte], width:cuint, height:cuint, pitch:csize_t):void) # 320 * 240 * 4
  cbaudio_t = (proc(left:int16, right:int16):void)
  cbaudio_batch_t = (proc(data:array[800, int16], frames:csize_t):void) # 48000/60
  cbinput_poll_t = (proc():void)
  cbset_environment_t = (proc(cmd:cuint, data:pointer):void)
  cbset_input_t = (proc(port:cuint, device:cuint, index:cuint, id:cuint):void)

var cb_video: cbvideo_t
var cb_audio: cbaudio_t
var cb_audio_batch: cbaudio_batch_t
var input_poll: cbinput_poll_t
var set_environment: cbset_environment_t
var set_input: cbset_input_t

proc retro_init*() {.stdcall,exportc,dynlib.} =
  echo "retro_init"

proc retro_deinit*() {.stdcall,exportc,dynlib.} =
  echo "retro_deinit"

proc retro_api_version*(): cuint {.stdcall,exportc,dynlib.} =
  return 1

proc retro_set_controller_port_device*(port: cuint; device: cuint) {.stdcall,exportc,dynlib.} =
  echo "retro_set_controller_port_device"
  echo port, device

proc retro_get_system_info*(info: ptr RetroSystemInfo) {.stdcall,exportc,dynlib.} =
  info.library_name = "null0";
  info.library_version = "v1"
  info.need_fullpath = true
  info.valid_extensions = "null0|wasm|zip"

proc retro_get_system_av_info*(info: ptr RetroSystemAvInfo) {.stdcall,exportc,dynlib.} =
  echo "retro_get_system_av_info"
  info.timing.fps = 60
  info.timing.sample_rate = 48000
  info.geometry.base_width = 320
  info.geometry.base_height = 240
  info.geometry.max_width = 320
  info.geometry.max_height = 240
  info.geometry.aspect_ratio = 4 / 3

proc retro_set_environment*(cb: cbset_environment_t) {.stdcall,exportc,dynlib.} =
  # set_environment = cb
  discard

proc retro_set_audio_sample*(cb: cbaudio_t) {.stdcall,exportc,dynlib.} =
  # cb_audio = cb
  discard

proc retro_set_audio_sample_batch*(cb: cbaudio_batch_t) {.stdcall,exportc,dynlib.} =
  cb_audio_batch = cb
  discard

proc retro_set_input_poll*(cb: cbinput_poll_t) {.stdcall,exportc,dynlib.} =
  # input_poll = cb
  discard

proc retro_set_input_state*(cb: cbset_input_t) {.stdcall,exportc,dynlib.} =
  # set_input = cb
  discard

proc retro_set_video_refresh*(cb: cbvideo_t) {.stdcall,exportc,dynlib.} =
  # cb_video = cb
  discard

proc retro_reset*() {.stdcall,exportc,dynlib.} =
  echo "retro_reset"

proc retro_run*() {.stdcall,exportc,dynlib.} =
  echo "retro_run"

proc retro_load_game*(info: ptr RetroGameInfo): bool {.stdcall,exportc,dynlib.} =
  echo "retro_load_game"
  print(info)
  return true

proc retro_unload_game*() {.stdcall,exportc,dynlib.} =
  echo "retro_unload_game"

proc retro_get_region*(): cuint {.stdcall,exportc,dynlib.} =
  return 0 # NTSC

proc retro_load_game_special*(`type`: cuint; info: ptr RetroGameInfo; num: csize_t): bool {.stdcall,exportc,dynlib.} =
  return true

proc retro_serialize_size*(): csize_t {.stdcall,exportc,dynlib.} =
  return 0

proc retro_serialize*(data: pointer; size: csize_t): bool {.stdcall,exportc,dynlib.} =
  return true

proc retro_unserialize*(data: pointer; size: csize_t): bool {.stdcall,exportc,dynlib.} =
  return true

proc retro_get_memory_data*(id: cuint): pointer {.stdcall,exportc,dynlib.} =
  discard

proc retro_get_memory_size*(id: cuint): csize_t {.stdcall,exportc,dynlib.} =
  return 0

proc retro_cheat_reset*() {.stdcall,exportc,dynlib.} =
  discard

proc retro_cheat_set*(index: cuint; enabled: bool; code: cstring) {.stdcall,exportc,dynlib.} =
  discard
