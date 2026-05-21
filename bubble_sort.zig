const std = @import("std");

fn generateRandomArray(allocator: std.mem.Allocator, size: usize) !std.ArrayList(u8) {
    var arrayList = std.ArrayList(u8){};
    const rand: std.Random = std.crypto.random;

    var i: usize = 0;
    while (i < size) : (i += 1) {
        try arrayList.append(allocator, rand.intRangeAtMost(u8, 1, 100));
    }

    return arrayList;
}

fn bubbleSort(arrayList: std.ArrayList(u8)) void {
    const n: usize = arrayList.items.len;
    var swapped: bool = true;

    while (swapped) {
        swapped = false;

        var j: usize = 0;

        while (j < n - 1) : (j += 1) {
            if (arrayList.items[j] > arrayList.items[j + 1]) {
                const temp = arrayList.items[j];

                arrayList.items[j] = arrayList.items[j + 1];
                arrayList.items[j + 1] = temp;

                swapped = true;
            }
        }
    }
}

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    var arrayList = try generateRandomArray(allocator, 10);
    defer arrayList.deinit(allocator);
    std.debug.print("generated array: {any}\n", .{arrayList.items});
    bubbleSort(arrayList);
    std.debug.print("bubble sorted array: {any}\n", .{arrayList.items});
}
