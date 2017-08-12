module servo_rotate_rod() {
    difference() {
        union() {
            cylinder(d=10, h=5);
            cylinder(d=9.8, h=13, $fa=70);
        }
        translate([0, 0, -1])
        cylinder(d=3, h=30);
        translate([0, 0, -1])
        cylinder(d=5.7, h=4);
        translate([0, 0, 7])
        cylinder(d=6, h=30);
    }
}
servo_rotate_rod();