import times
import os
import unittest

import ../src/null0/soloud
import ../src/null0/physfs

suite "Soloud":
  test "play ogg":
    var sl = Soloud_create()
    discard Soloud_init(sl)
    Soloud_setGlobalVolume(sl, 1)

    check physfs.init("test")
    check physfs.mount("sound.null0", "", true)
    var b = physfs.read("assets/notnullgames.ogg")
    var stream = WavStream_create()
    var success = WavStream_loadMem(stream, cast[ptr uint8](b.data), cuint b.length)

    let currentTime = epochTime()
    let length = WavStream_getLength(stream)
    discard Soloud_play(cast[ptr Soloud](sl), cast[ptr Wav](stream))

    while epochTime() - currentTime <= length:
      sleep(100)

    Soloud_deinit(sl)
    Soloud_destroy(sl)
    discard physfs.deinit()