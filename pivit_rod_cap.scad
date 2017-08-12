include <config.scad>
module pivit_rod_cap() {
    difference() {
        hull() {
            cylinder(d=15, h=2);
            translate([10, 0, 0]) cylinder(d=10, h=2);
            translate([-10, 0, 0]) cylinder(d=10, h=2);
        }
        translate([10, 0, -1]) cylinder(d=5, h=4);
        translate([-10, 0, -1]) cylinder(d=5, h=4);
    }
}

pivit_rod_cap();