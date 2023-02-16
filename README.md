Eventually, this will have a native host and a libretro core.

```sh
# install tools/libs
nimble install -d

# build null0 runtime
nimble build

# build null0 libretro core
nimble libretro

# build example carts
nimble carts

# run unit-tests to play with ideas
nimble test
```