include <config.scad>

module top() {
    difference() {
        union() {
            translate([0, 0, -1])
            cube([102, 26, 2], center=true);
            
            translate([0, 0, -12-22])
            rotate([0, 90, 0]) 
            motor_mount();
            
            hull() {
                translate([0, -11.75, -25])
                cube([62, 2.5, 1], center=true);
                translate([0, -11.75, -1])
                cube([102, 2.5, 2], center=true);
            }
            
            hull() {
                translate([0, 11.75, -25])
                cube([62, 2.5, 1], center=true);
                translate([0, 11.75, -1])
                cube([102, 2.5, 2], center=true);
            }
        }
        translate([44.5, 5, 0])
        cylinder(d=di_m4_d, h=10, center=true);
        translate([-44.5, 5, 0])
        cylinder(d=di_m4_d, h=10, center=true);
        translate([44.5, -5, 0])
        cylinder(d=di_m4_d, h=10, center=true);
        translate([-44.5, -5, 0])
        cylinder(d=di_m4_d, h=10, center=true);
    }
}

module motor_mount() {
    difference() {
        union() {
            translate([-5, 0, 0])
            cube([10, 21+5, 62], center=true);
        }
        translate([-5, 0, 0])
        cube([11, 21, 43], center=true);
        
        translate([1, 5, -24.5])
        rotate([0, -90, 0]) {
            cylinder(d = 3.8, h = 3.5, $fs=0.4);
            cylinder(d = 2.5, h = 14, $fs=0.4);
        }
        translate([1, -5, -24.5])
        rotate([0, -90, 0]) {
            cylinder(d = 3.8, h = 3.5, $fs=0.4);
            cylinder(d = 2.5, h = 14, $fs=0.4);
        }
        translate([1, 5, 24.5])
        rotate([0, -90, 0]) {
            cylinder(d = 3.8, h = 3.5, $fs=0.4);
            cylinder(d = 2.5, h = 14, $fs=0.4);
        }
        translate([1, -5, 24.5])
        rotate([0, -90, 0]) {
            cylinder(d = 3.8, h = 3.5, $fs=0.4);
            cylinder(d = 2.5, h = 14, $fs=0.4);
        }
    }
}
//motor_mount();
top();