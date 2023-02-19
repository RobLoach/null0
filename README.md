Eventually, this will have a native host and a libretro core.

## development

You're going to need some stuff installed on your system.

```sh
# mac
brew install physfs emscripten

# linux (debian/ubuntu/etc)
sudo apt install -y libphysfs-dev emscripten
```

Now you can do some stuff:

```sh
# install tools/libs
nimble install -d

# build null0 standalone runtime
nimble build

# build null0 libretro core
nimble libretro

# build example carts
nimble carts

# run unit-tests to play with ideas
nimble test
```

## notes

- [pntr](https://github.com/notnullgames/pntr-nim)
- [soloud](https://gist.github.com/zacharycarter/846869eb3423e20af04dea226b65c18f#soloud)