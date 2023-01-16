import wasm3

let env = loadWasmEnv(readFile("null0.wasm"))

proc null0_log(message: string) =
  echo message, "\n"

m3_LinkRawFunction(env, "*", "null0_log", "i(i)", null0_log)

# let addFunc = env.findFunction("add")
# let multiplyFunc = env.findFunction("multiply")
# check addFunc.call(int32, 3, 4) == 7
# check multiplyFunc.call(int32, 3, 4) == 12



