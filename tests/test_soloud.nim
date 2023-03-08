import os
import unittest

import ../src/null0/soloud

# discard Soloud_initEx(sl, CLIP_ROUNDOFF, MINIAUDIO, 44100, 0, 2)
# discard Soloud_initEx(sl, CLIP_ROUNDOFF, NULLDRIVER, 44100, 0, 2)

suite "Soloud":
  test "text":
    var sl = Soloud_create()
    discard Soloud_init(sl)
    Soloud_setGlobalVolume(sl, 3.0)

    var speech = Speech_create()
    discard Speech_setText(speech, "Hello")
    
    discard Soloud_play(sl, speech)
    while Soloud_getVoiceCount(sl) > 0:
      sleep(100)
    
    Speech_destroy(speech)
    Soloud_deinit(sl)
    Soloud_destroy(sl)
  
  test "ogg: file":
    var sl = Soloud_create()
    discard Soloud_init(sl)
    Soloud_setGlobalVolume(sl, 3.0)

    var wav = Wav_create()
    discard Wav_load(wav, "src/carts/sound/assets/notnullgames.ogg")
    
    discard Soloud_play(sl, wav)
    while Soloud_getVoiceCount(sl) > 0:
      sleep(100)

    Wav_destroy(wav)
    Soloud_deinit(sl)
    Soloud_destroy(sl)

