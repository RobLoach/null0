import os
import unittest

import ../src/null0/soloud

# discard Soloud_initEx(sl, CLIP_ROUNDOFF, MINIAUDIO, 44100, 0, 2)
# discard Soloud_initEx(sl, CLIP_ROUNDOFF, NULLDRIVER, 44100, 0, 2)

suite "Soloud":
  test "text":
    let sl = Soloud_create()
    defer: Soloud_destroy(sl)

    discard Soloud_init(sl)
    Soloud_setGlobalVolume(sl, 3.0)

    let speech = Speech_create()
    defer: Speech_destroy(speech)

    discard Speech_setText(speech, "Hello")
    
    discard Soloud_play(sl, speech)
    while Soloud_getVoiceCount(sl) > 0:
      sleep(100)
  
  test "ogg: file":
    let sl = Soloud_create()
    defer: Soloud_destroy(sl)

    discard Soloud_init(sl)
    Soloud_setGlobalVolume(sl, 3.0)

    let wav = Wav_create()
    defer: Wav_destroy(wav)

    discard Wav_load(wav, "src/carts/sound/assets/notnullgames.ogg")
    
    discard Soloud_play(sl, wav)
    while Soloud_getVoiceCount(sl) > 0:
      sleep(100)

  test "ogg: memory":
    let sl = Soloud_create()
    defer: Soloud_destroy(sl)

    discard Soloud_init(sl)
    Soloud_setGlobalVolume(sl, 3.0)

    let wav = Wav_create()
    defer: Wav_destroy(wav)

    let c = readFile("src/carts/sound/assets/notnullgames.ogg").cstring
    # TODO: pointer being freed was not allocated
    discard Wav_loadMem(wav, cast[pointer](c.unsafeAddr), cuint c.len)
    
    discard Soloud_play(sl, wav)
    while Soloud_getVoiceCount(sl) > 0:
      sleep(100)


