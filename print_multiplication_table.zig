const std = @import("std");

const Position = enum {
    Up,
    Down,
};

fn trianglePosition(position: Position) void {
    var i: u8 = 1;
    var j: u8 = 1;
    const end: u8 = 10;
    while (i < end) {
        while (j < end) {
            if (position == Position.Down) {
                if (i >= j)
                    std.debug.print("{d} * {d} = {d:2}   ", .{ i, j, i * j });
            } else if (position == Position.Up) {
                if (i <= j)
                    std.debug.print("{d} * {d} = {d:2}   ", .{ i, j, i * j });
            } else {
                std.debug.print("no support position", .{});
            }
            j += 1;
        }
        std.debug.print("\n", .{});
        i += 1;
        j = 1;
    }
}

pub fn main() void {
    trianglePosition(Position.Down);
    std.debug.print("{s}\n", .{"=" ** 150});
    trianglePosition(Position.Up);
}
