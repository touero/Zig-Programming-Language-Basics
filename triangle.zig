const std = @import("std");

const TriangleSides = struct {
    a: f32,
    b: f32,
    c: f32,

    fn isValid(self: TriangleSides) bool {
        return self.a + self.b > self.c and self.a + self.c > self.b and self.b + self.c > self.a;
    }

    fn area(self: TriangleSides) f32 {
        const s = (self.a + self.b + self.c) / 2;
        return std.math.sqrt(s * (s - self.a) * (s - self.b) * (s - self.c));
    }
};

fn triangle(sides: TriangleSides) void {
    if (sides.isValid()) {
        std.debug.print("Three sides: a={d}, b={d}, c={d}\n", .{ sides.a, sides.b, sides.c });
        std.debug.print("Area of the triangle: {d}\n", .{sides.area()});
    } else {
        std.debug.print("Can't form a triangle\n", .{});
    }
}

pub fn main() !void {
    var buffer: [1024]u8 = undefined;

    var stdin_reader = std.fs.File.stdin().reader(&buffer);
    const stdin = &stdin_reader.interface;

    std.debug.print("Please input three sides of a triangle: ", .{});

    const input_line = try stdin.takeDelimiterExclusive('\n');

    var iter = std.mem.tokenizeScalar(u8, input_line, ' ');

    const a = try std.fmt.parseFloat(f32, iter.next().?);
    const b = try std.fmt.parseFloat(f32, iter.next().?);
    const c = try std.fmt.parseFloat(f32, iter.next().?);

    const sides = TriangleSides{ .a = a, .b = b, .c = c };

    // const sides = TriangleSides{
    //     .a = try std.fmt.parseFloat(f32, iter.next().?),
    //     .b = try std.fmt.parseFloat(f32, iter.next().?),
    //     .c = try std.fmt.parseFloat(f32, iter.next().?),
    // };
    triangle(sides);
}
