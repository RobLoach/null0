import os
import unittest

import ../src/null0/soloud

suite "Soloud":
  test "text":
    var sl = Soloud_create()
    discard Soloud_initEx(sl, CLIP_ROUNDOFF, MINIAUDIO, 44100, 0, 2)
    # discard Soloud_init(sl)
    Soloud_setGlobalVolume(sl, 3.0)
    var speech = Speech_create()
    discard Speech_setText(speech, "Hello")
    discard Soloud_play(sl, speech)
    while Soloud_getVoiceCount(sl) > 0:
      sleep(100)
