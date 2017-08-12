include <config.scad>

module thermal_case() {
    // A 3D printed case for just the thermal imaging camera.
    w = 26;
    h = 38;
    t = 2;
    r = 5;
    l = 12.5;
    
    difference() {
        union() {
            linear_extrude(l)
            polygon(
                [[0, 0], 
                [w+2*t, 0], 
                [w+2*t, h+2*t], 
                [w+t, h+2*t], 
                [w+t, t],
                [w+t-1, t],
                [w+t-2, t+1],
                [w+t-3, t+1],
                [w+t-4, t],
                [t+4, t],
                [t+3, t+1],
                [t+2, t+1],
                [t+1, t],
                [t, t],
                [t, h+2*t],
                [0, h+2*t]
            ]);
            cube([4, 10, 4.25-2]);
            translate([0, 0, 4.2]) cube([4, 10, 2]);
            translate([w+t-2, 0, 0]) cube([4, 10, 4.25-2]);
            translate([w+t-2, 0, 4.2]) cube([4, 10, 2]);
            translate([0, 0, -2]) cube([w+2*t, h+2*t, 2]);
            translate([0, 0, l]) cube([w+2*t, h+2*t, 2]);
            
            // lens cap bolt holes
            difference() {
                hull() {
                    translate([-di_m4_d/2, t+1+4+r, -3])
                    cylinder(d = di_m4_d+6, h=l+4);
                    translate([0, t+1+4+r-10, -2])
                    cube([t*2+w, 20, l+4]);
                    translate([w+2*t+di_m4_d/2, t+1+4+r, -3])
                    cylinder(d = di_m4_d+6, h=l+4);
                }
                translate([t, 0, 0]) cube([w, h, l]);
                translate([-di_m4_d/2, t+1+4+r, -3])
                cylinder(d = di_m4_d, h=l+6);
                translate([w+2*t+di_m4_d/2, t+1+4+r, -3])
                cylinder(d = di_m4_d, h=l+6);
            }
            
            // end seal
            difference() {
                union() {
                    hull() {
                        translate([-2, h+t, -4])
                        cube([w+4*t, 2, l+8]);
                        translate([0, h, -2])
                        cube([w+2*t, 2, l+4]);
                    }
                    hull() {
                        translate([di_m4_d/2+2, h-10, l/2])
                        rotate([-90, 0, 0])
                        cylinder(d=di_m4_d+6);
                        translate([-4, h+t+1, l/2])
                        rotate([-90, 0, 0])
                        cylinder(d=di_m4_d+6);
                        translate([-4, h+t-3, l/2])
                        rotate([-90, 0, 0])
                        cylinder(d=di_m4_d+6);
                    }
                    
                    translate([w+2*t, 0, 0])
                    mirror([1, 0, 0])
                    hull() {
                        translate([di_m4_d/2+2, h-10, l/2])
                        rotate([-90, 0, 0])
                        cylinder(d=di_m4_d+6);
                        translate([-4, h+t+1, l/2])
                        rotate([-90, 0, 0])
                        cylinder(d=di_m4_d+6);
                        translate([-4, h+t-3, l/2])
                        rotate([-90, 0, 0])
                        cylinder(d=di_m4_d+6);
                    }
                }
                    
            }
            
            
        }
        // main cutout
        translate([2, 10, 0])
        cube([w, h, l]);
        
        // Hole for end cap bolt
        translate([w+2*t, 0, 0])
        mirror([1, 0, 0]) {
            translate([-4, h+t-10, l/2])
            rotate([-90, 0, 0]) cylinder(d=di_m4_d, h=30);
            
            hull() {
                translate([-4, h+t-12, l/2])
                rotate([-90, 0, 0]) cylinder(d=di_m4_nut, h=9, $fa=60);
                translate([-6, h+t-12, l/2])
                rotate([-90, 0, 0]) cylinder(d=di_m4_nut, h=9, $fa=60);
            }
        }
        
        translate([-4, h+t-10, l/2])
        rotate([-90, 0, 0]) cylinder(d=di_m4_d, h=30);
        
        hull() {
            translate([-4, h+t-12, l/2])
            rotate([-90, 0, 0]) cylinder(d=di_m4_nut, h=9, $fa=60);
            translate([-6, h+t-12, l/2])
            rotate([-90, 0, 0]) cylinder(d=di_m4_nut, h=9, $fa=60);
        }
        
        //translate([0, 0, -2]) sphere(10);
        translate([0, h+t+2, 0])
        scale([1, 1, 1]) {
            hull() { 
                translate([0, 0, -2]) sphere(1);
                translate([w+2*t, 0, -2]) sphere(1);
            }
            hull() { 
                translate([0, 0, -2]) sphere(1);
                translate([0, 0, l+2]) sphere(1);
            }
            hull() { 
                translate([w+2*t, 0, -2]) sphere(1);
                translate([w+2*t, 0, l+2]) sphere(1);
            }
            hull() { 
                translate([0, 0, l+2]) sphere(1);
                translate([w+2*t, 0, l+2]) sphere(1);
            }
        }
        
        translate([t+w/2, t+1+4+r, t]) cylinder(r=r+3, h=20);
        translate([t+w/2-2*r, t+1+4-r, l+t-0.3]) cube([r*4, r*4, 10]);
        
        translate([-di_m4_d/2, t+1+4+r, -4])
        rotate([0, 0, 30]) cylinder(d = di_m4_nut, h=1+2, $fa=60);
        translate([w+2*t+di_m4_d/2, t+1+4+r, -4])
        rotate([0, 0, 30]) cylinder(d = di_m4_nut, h=1+2, $fa=60);
    }
}

module thermal_lens_cap() {
    w = 26;
    h = 38;
    t = 2;
    r = 5;
    difference() {
        hull() {
            translate([w+2*t+di_m4_d/2, t+1+4+r, 0])
            cylinder(d = di_m4_d+4, h=3);
            translate([-di_m4_d/2, t+1+4+r, 0])
            cylinder(d = di_m4_d+4, h=3);
            translate([t+w/2-2*r-2, t+1+4-r-2, 0]) 
            cube([r*4+4, r*4+4, 3]);
        }
        translate([t+w/2, t+1+4+r, -2]) cylinder(r=9, h=20);
        translate([-di_m4_d/2, t+1+4+r, -3]) cylinder(d = di_m4_d, h=16);
        translate([w+2*t+di_m4_d/2, t+1+4+r, -3]) cylinder(d = di_m4_d, h=16);
    }
}

module thermal_end_cap() {
    w = 26;
    h = 38;
    l = 12.5;
    t = 2;
    r = 5;
    difference() {
        hull() {
            translate([-4, 0, l/2])
            rotate([-90, 0, 0])
            cylinder(d=di_m4_d+6, h=3);
            translate([w+2*t+4, 0, l/2])
            rotate([-90, 0, 0])
            cylinder(d=di_m4_d+6, h=3);
            translate([-2, 0, -4])
            cube([w+4*t, 3, l+8]);
        }
        translate([-4, -1, l/2])
        rotate([-90, 0, 0])
        cylinder(d=di_m4_d, h=30);
        
        translate([w+2*t+4, -1, l/2])
        rotate([-90, 0, 0])
        cylinder(d=di_m4_d, h=30);
        
        scale([1, 0.5, 1]) {
            hull() { 
                translate([0, 0, -2]) sphere(1);
                translate([w+2*t, 0, -2]) sphere(1);
            }
            hull() { 
                translate([0, 0, -2]) sphere(1);
                translate([0, 0, l+2]) sphere(1);
            }
            hull() { 
                translate([w+2*t, 0, -2]) sphere(1);
                translate([w+2*t, 0, l+2]) sphere(1);
            }
            hull() { 
                translate([0, 0, l+2]) sphere(1);
                translate([w+2*t, 0, l+2]) sphere(1);
            }
        }
        translate([5, -1, l/2-0.75])
        cube([40, 4, 1.5]);
    }
}

translate([0, 0, 13]) thermal_lens_cap();
translate([0, 44, 0]) thermal_end_cap();
thermal_case();
