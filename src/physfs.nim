# simplified physfs

# ideas from https://github.com/fowlmouth/physfs
# see here for more ideas: https://github.com/treeform/staticglfw/blob/master/src/staticglfw.nim#L4-L88

import std/options

# TODO: look into not having to have physfs installed globally (see pntr or wasm3 wrapper)
when defined(macosx):
  {.passL: "-lphysfs".}
when defined(linux):
  {.passL: "-lphysfs".}


type 
  PHYSFS_File* {.pure, final.} = object 
    opaque: pointer

{.push callconv: cdecl, importc:"PHYSFS_$1".}
proc init*(name: cstring): cint
proc deinit*(): cint
proc mount*(newDir: cstring, mountPoint: cstring, appendToPath:cint): cint
proc openRead*(filename: cstring): ptr PHYSFS_File
proc exists*(name: cstring): int
proc close*(handle: ptr PHYSFS_File): void
proc fileLength*(handle: ptr PHYSFS_File): int64
proc readBytes*(handle: ptr PHYSFS_File, buffer: ptr UncheckedArray[byte], len: uint64): int64
proc writeBytes*(handle: ptr PHYSFS_File, buffer: ptr UncheckedArray[byte], len: uint64): int64
proc mountMemory*(buff: ptr UncheckedArray[byte], length:int64, del:Option[pointer], newDir:cstring, mountPoint:cstring, appendToPath:cint): cint
{.pop.}

# wrappers to make things more nim-ish & easier

proc init*(name: string): bool =
  return init(cstring name) == 1

proc exists*(filename:string): bool = 
  return exists(cstring filename) == 1

proc mount*(newDir: string, mountPoint: string, appendToPath:bool): bool =
  return mount(cstring newDir, cstring mountPoint, (if appendToPath: 1 else: 0)) == 1

proc mountMemory*(buff: ptr UncheckedArray[byte], length:int64, newDir:string, mountPoint:string, appendToPath:bool): bool =
  return mountMemory(buff, length, none(pointer), cstring newDir, cstring mountPoint, (if appendToPath: 1 else: 0)) == 1

proc read*(filename:string): ptr UncheckedArray[byte] =
  if not exists(filename):
    return 
  var f = openRead(filename)
  var l = uint64 f.fileLength
  var buffer = cast[ptr UncheckedArray[byte]](alloc(l))
  var b = uint64 f.readBytes(buffer, l)
  f.close()
  if b == l:
    return buffer

