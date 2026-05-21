const std = @import("std");
const end: u16 = 1000;

fn exponentiation(base: u16, exp: u16) u16 {
    var result: u16 = 1;
    var i: u16 = 0;
    while (i < exp) {
        result *= base;
        i += 1;
    }
    return result;
}

fn narcissisticNumbers() void {
    var i: u16 = 100;
    while (i < end) {
        const single_digit: u16 = @mod(i, 10);
        const tens_digit: u16 = @mod(i / 10, 10);
        const gundreds_digit: u16 = i / 100;
        if (exponentiation(single_digit, 3) + exponentiation(tens_digit, 3) + exponentiation(gundreds_digit, 3) == i) {
            std.debug.print("{} is a narcissistic number\n", .{i});
        }
        i += 1;
    }
}

pub fn main() void {
    narcissisticNumbers();
}
