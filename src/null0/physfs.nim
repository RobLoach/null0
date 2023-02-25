# simplified physfs

# ideas from https://github.com/fowlmouth/physfs
# see here for more ideas: https://github.com/treeform/staticglfw/blob/master/src/staticglfw.nim#L4-L88

{.emit: """
#define PHYSFS_SUPPORTS_ZIP 1
""".}

{.compile: "vendor/physfs/src/physfs.c".}
{.compile: "vendor/physfs/src/physfs_byteorder.c".}
{.compile: "vendor/physfs/src/physfs_unicode.c".}
{.compile: "vendor/physfs/src/physfs_platform_posix.c".}
{.compile: "vendor/physfs/src/physfs_platform_unix.c".}
{.compile: "vendor/physfs/src/physfs_platform_windows.c".}
{.compile: "vendor/physfs/src/physfs_platform_os2.c".}
{.compile: "vendor/physfs/src/physfs_platform_qnx.c".}
{.compile: "vendor/physfs/src/physfs_platform_android.c".}

when defined(macosx):
  {.compile: "vendor/physfs/src/physfs_platform_apple.m".}
  {.passL: "-framework IOKit -framework Foundation".}

when defined(linux):
  {.passL: "-lpthread".}

{.compile: "vendor/physfs/src/physfs_archiver_dir.c".}
{.compile: "vendor/physfs/src/physfs_archiver_zip.c".}
{.compile: "vendor/physfs/src/physfs_archiver_unpacked.c".}
{.compile: "vendor/physfs/src/physfs_archiver_grp.c".}
{.compile: "vendor/physfs/src/physfs_archiver_hog.c".}
{.compile: "vendor/physfs/src/physfs_archiver_7z.c".}
{.compile: "vendor/physfs/src/physfs_archiver_mvl.c".}
{.compile: "vendor/physfs/src/physfs_archiver_qpak.c".}
{.compile: "vendor/physfs/src/physfs_archiver_wad.c".}
{.compile: "vendor/physfs/src/physfs_archiver_slb.c".}
{.compile: "vendor/physfs/src/physfs_archiver_iso9660.c".}
{.compile: "vendor/physfs/src/physfs_archiver_vdf.c".}



import std/options

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
proc readBytes*(handle: ptr PHYSFS_File, buffer: pointer, len: uint64): int64
proc writeBytes*(handle: ptr PHYSFS_File, buffer: pointer, len: uint64): int64
proc mountMemory*(buff: pointer, length:int64, del:Option[pointer], newDir:cstring, mountPoint:cstring, appendToPath:cint): cint
{.pop.}

type
  FileData* = object
    length*: uint64
    data*: ptr UncheckedArray[byte]

# wrappers to make things more nim-ish & easier

proc init*(name: string): bool =
  return init(cstring name) == 1

proc exists*(filename:string): bool = 
  return exists(cstring filename) == 1

proc mount*(newDir: string, mountPoint: string, appendToPath:bool): bool =
  return mount(cstring newDir, cstring mountPoint, (if appendToPath: 1 else: 0)) == 1

proc mountMemory*(buff: ptr UncheckedArray[byte], length:int64, newDir:string, mountPoint:string, appendToPath:bool): bool =
  return mountMemory(buff, length, none(pointer), cstring newDir, cstring mountPoint, (if appendToPath: 1 else: 0)) == 1

proc fileLength*(filename:string): uint64 = 
  if not exists(filename):
    return
  var f = openRead(filename)
  var l = uint64 f.fileLength
  return l

proc read*(filename:string): FileData =
  if not exists(filename):
    return 
  var f = openRead(filename)
  var l = uint64 f.fileLength
  var buffer = cast[ptr UncheckedArray[byte]](alloc(l))
  var b = uint64 f.readBytes(buffer, l)
  f.close()
  if b == l:
    var o = FileData(
      length: l,
      data: buffer
    )
    return o

