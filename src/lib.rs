#[macro_use]
extern crate ruru;

use ruru::{Boolean, Class, RString};

methods!(
    RString,
    itself,

    fn string_is_blank() -> Boolean {
        Boolean::new(itself.to_string().chars().all(|c| c.is_whitespace()))
    }
);

#[no_mangle]
pub extern fn init_rusty_blank() {
    Class::from_existing("String").define(|itself| {
        itself.def("blank?", string_is_blank);
    });
}
