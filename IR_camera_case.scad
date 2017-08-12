include <config.scad>

$fs=0.1;

w = 26;
t = 2;
l = 27;
h = 28;
stand = 3;
p = 2.5;
cable_width = 18;

module IR_camera_case() {
    
    union() {
        difference() {
            // Main box
            translate([0, 0, (h+t+p+stand)/2]) 
            cube([26+2*t, 27+2*t, h+t+p+stand], center=true);
            // Main hole
            translate([0, 0, (h+t+p+stand)/2+t]) 
            cube([26, 27, h+t+p+stand], center=true);
            // Lens lip
            translate([0, 0, (h+t+p+stand)/2+h+t+stand]) 
            cube([26+t, 27+t, h+t+p+stand], center=true);
            // Cable hole
            translate([0, -15, t+stand]) 
            cube([cable_width, 10, 1], center=true);
        }
        difference() {
            x = 21;
            union() {
                translate([-x/2, 27/2-2]) cylinder(d=8, h=t+stand);
                translate([x/2, 27/2-2]) cylinder(d=8, h=t+stand);
                translate([-x/2, 27/2-2-13.5]) cylinder(d=8, h=t+stand);
                translate([x/2, 27/2-2-13.5]) cylinder(d=8, h=t+stand);
            }
            translate([-x/2, 27/2-2, 1]) cylinder(d=di_m2_t, h=t+stand);
            translate([x/2, 27/2-2, 1]) cylinder(d=di_m2_t, h=t+stand);
            translate([-x/2, 27/2-2-13.5, 1]) cylinder(d=di_m2_t, h=t+stand);
            translate([x/2, 27/2-2-13.5, 1]) cylinder(d=di_m2_t, h=t+stand);
        }
        difference() {
            hull() {
                translate([0, 5+l/2+t, 1.5])
                cube([w+2*t, 10, 3], center=true);
                translate([0, l/2+t/2, h/2])
                cube([w+2*t, t, h], center=true);
            }
            translate([0, l/2+5+t, h/2+3])
            cube([w, 10, h], center=true);
            
            translate([8, l/2+t+5]) cylinder(d=di_m4_d, h=5);
            translate([-8, l/2+t+5]) cylinder(d=di_m4_d, h=5);
        }
    }
}

module IR_camera_cap() {
    g = 0.2;
    difference() {
        translate([0, 0, (3+t)/2]) cube([w+4*t, l+4*t, 3+t], center=true);
        translate([0, 0, (3+t)/2+t]) cube([w+2*t+2*g, l+2*t+2*g, 3+t], center=true);
        translate([0, l/2+t-10.5, -1]) cylinder(d=21.5, h=10);
    }
}

IR_camera_cap();

//IR_camera_case();