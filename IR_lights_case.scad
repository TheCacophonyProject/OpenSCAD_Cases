$fa = 5;
$fs = 0.2;
include <config.scad>

w = 63;
l = 22;
h = 16;
t = 2;
led_stand = 1;
p = 2.5;
module ir_lights_case() {
    difference() {
        union() {
            difference() {
                cube([w+2*t, l+2*t, h+t+led_stand+p]);
                translate([t, t, t]) cube([w, l, h+t+led_stand+p]);
            }
            translate([w/2+t, l/2+t, 0]) {
                translate([-20, 0, 0]) cylinder(d=10, h=t+led_stand);
                translate([20, 0, 0]) cylinder(d=10, h=t+led_stand);
                translate([0, 0, (t+led_stand)/2]) cube([14, l, t+led_stand], center=true);
            }
            translate([w/2+t, 0, 1.5])
            hull() {
                translate([0, -5, 0]) cube([35, 10, 3], center=true);
                translate([0, 1, 10]) cube([35, 1, 14], center=true);
                
            }
        }
        translate([w/2+t, l/2+t, 1]) {
            translate([-4, 13.5/2, 0]) cylinder(d=2, h=10);
            translate([4, 13.5/2, 0]) cylinder(d=2, h=10);
            translate([4, -13.5/2, 0]) cylinder(d=2, h=10);
            translate([-4, -13.5/2, 0]) cylinder(d=2, h=10);
            
        }
        translate([t/2, t/2, h+t+p])
        cube([w+t, l+t, p*2]);
        
        // 
        translate([w/2+t-31/2, -10, 3])
        cube([31, 10, 30]);
        
        // screw holes
        translate([w/2+t-16/2, -5, 0])
        cylinder(d=di_m4_d, h=4);
        translate([w/2+t+16/2, -5, 0])
        cylinder(d=di_m4_d, h=4);
        
        // Hole for cable
        translate([w/2+t, 10, 6])
        rotate([-90, 0, 0])
        cylinder(d=5, h=30);
    }
}

module lid() {
    g = 0.2;
    difference() {
        cube([w+4*t, l+4*t, t+3]);
        translate([t-g, t-g, t]) cube([w+2*t+2*g, l+2*t+2*g, t+3]);
        hull() {
            translate([l/2+2*t, l/2+2*t, 0]) cylinder(d=21, h=5);
            translate([w+4*t-l/2-2*t, l/2+2*t, 0]) cylinder(d=21, h=5);
        }
    }
}
//lid();
ir_lights_case();