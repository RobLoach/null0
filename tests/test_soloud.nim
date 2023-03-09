import os
import unittest

import ../src/null0/soloud
import ../src/null0/physfs

suite "Soloud":
  test "text":
    let sl = Soloud_create()
    defer: Soloud_cleanup(sl)

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
    defer: Soloud_cleanup(sl)

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
    defer: Soloud_cleanup(sl)

    discard Soloud_init(sl)
    Soloud_setGlobalVolume(sl, 3.0)

    let wav = Wav_create()
    defer: Wav_destroy(wav)

    let c = readFile("src/carts/sound/assets/notnullgames.ogg")
    discard Wav_loadMemEx(wav, unsafeAddr c[0], cuint len(c), 1, 0)
    
    discard Soloud_play(sl, wav)
    while Soloud_getVoiceCount(sl) > 0:
      sleep(100)

  test "ogg: physfs":
    check physfs.init("test")
    defer: discard physfs.deinit()

    check physfs.mount("sound.null0", "", true)
    let sl = Soloud_create()
    defer: Soloud_cleanup(sl)

    discard Soloud_init(sl)
    Soloud_setGlobalVolume(sl, 3.0)

    let wav = Wav_create()
    defer: Wav_destroy(wav)

    let c = physfs.read("/assets/notnullgames.ogg")
    discard Wav_loadMemEx(wav, unsafeAddr c.data[0], cuint c.length, 1, 0)
    
    discard Soloud_play(sl, wav)
    while Soloud_getVoiceCount(sl) > 0:
      sleep(100)



