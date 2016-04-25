extern crate ruru;

use ruru::{AnyObject, Boolean, Class, RString};
use ruru::types::Argc;

#[no_mangle]
pub extern fn is_blank(_: Argc, _: *const AnyObject, itself: RString) -> Boolean {
    Boolean::new(itself.to_string().chars().all(|c| c.is_whitespace()))
}

#[no_mangle]
pub extern fn init_rusty_blank() {
    Class::from_existing("String").define(|itself| {
        itself.def("blank?", is_blank);
    });
}
