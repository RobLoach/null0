# simplified physfs

# ideas from https://github.com/fowlmouth/physfs
# see here for more ideas: https://github.com/treeform/staticglfw/blob/master/src/staticglfw.nim#L4-L88

import std/options

when defined(macosx):
  {.passL: "-L/opt/homebrew/Cellar/physfs/3.2.0/lib -lphysfs".}

type 
  PHYSFS_File* {.pure, final.} = object 
    opaque: pointer

{.push callconv: cdecl, importc:"PHYSFS_$1".}
proc init*(name: cstring): cint
proc mount*(newDir: cstring, mountPoint: cstring, appendToPath:cint): cint
proc openRead*(filename: cstring): ptr PHYSFS_File
proc exists*(name: cstring): int
proc close*(handle: ptr PHYSFS_File): void
proc fileLength*(handle: ptr PHYSFS_File): int64
proc readBytes*(handle: ptr PHYSFS_File, buffer: cstring, len: uint64): int64
proc writeBytes*(handle: ptr PHYSFS_File, buffer: cstring, len: uint64): int64
proc mountMemory*(buff:cstring, length:int64, del:Option[pointer], newDir:cstring, mountPoint:cstring, appendToPath:cint): cint
{.pop.}

# wrappers to make things more nim-ish & easier

proc init*(name: string): bool =
  return init(cstring name) == 1

proc mount*(newDir: string, mountPoint: string, appendToPath: bool): bool =
  var a:cint = 0
  if appendToPath:
    a = 1
  return mount(cstring newDir, cstring mountPoint, a) == 1

proc mountMemory*(buff:string, newDir:string, mountPoint:string, appendToPath: bool): bool =
  var a:cint = 0
  if appendToPath:
    a = 1
  return mountMemory(cstring buff, int64 len(buff), none(pointer), cstring newDir, cstring mountPoint, a) == 1

proc read*(filename:string): string =
  let f = openRead(cstring filename)
  let s = f.fileLength()
  if s > 0:
    let str = newString(s) 
    discard f.readBytes(cstring str, uint64 s)
    f.close()
    return str
  f.close()

proc write*(filename:string, data:string) =
  let f = openRead(cstring filename)
  discard f.writeBytes(cstring data, uint64 data.len)
  f.close()

proc exists*(filename:string): bool = 
  return exists(cstring filename) == 1
