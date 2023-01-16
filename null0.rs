// Example WASM
// rustc --target wasm32-unknown-unknown null0.rs -o null0.wasm --crate-type cdylib

use std::ffi::CString;
use std::os::raw::c_char;

extern "C" {
    fn null0_log(s: *const c_char);
}

pub fn log(message: String) {
    let c_to_print = CString::new(message).expect("CString::new failed");
    unsafe {
        null0_log(c_to_print.as_ptr());
    }
}


#[no_mangle]
pub extern fn add(x: i32, y: i32) -> i32 {
    x + y
}

#[no_mangle]
pub extern fn multiply(x: i32, y: i32) -> i32 {
    x * y
}

#[no_mangle]
pub extern fn init() {
    log("Hi!".to_owned());
}