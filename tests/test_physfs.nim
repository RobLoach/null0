import unittest
import ../src/null0/physfs

suite "Physfs":
  test "mount zip file and read from it using read()":
    check physfs.init("test")
    defer: discard physfs.deinit()
    
    check physfs.mount("draw.null0", "", true)
    var b = physfs.read("assets/logo.png")
    var l = physfs.fileLength("assets/logo.png")
    check l == 9211