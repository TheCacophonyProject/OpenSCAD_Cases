include <config.scad>
module main() {
    d1=12.2;
    d2=7.5;
    l=55.5;
    difference() {
        union() {
            translate([0, 0, -5])
            hull() {
                cylinder(d = d1+4, h = 10, $fs=0.5);
            
                translate([-(l-d2)/2, 0, 0])
                cylinder(d = d2+4, h = 10, $fs=0.5);
                
                translate([(l-d2)/2, 0, 0])
                cylinder(d = d2+4, h = 10, $fs=0.5);
            }
            
            union() {
                hull() {translate([-18, 0, 0])c1(); translate([-12, 0, 0]) c2();}
                translate([-12, 0, 0]) hull() {c2(); c5();}
                translate([-12, 0, 0]) hull() {c5(); c6();}
            }
            
            hull() {mirror([1, 0, 0]) c1(); translate([-18, 0, 0])c1();}
            
            mirror([1, 0, 0]) {
                hull() {c1(); c2();}
                hull() {c2(); c3();}
                hull() {c3(); c4();}
                hull() {c4(); c7();}
            }
            translate([-57, 0, -55])
            motor_mount();
        }
        
        // Screw holes
        translate([0, 0, -55])
        rotate([0, 90, 0])
        cylinder(d=di_m4_d, h=100);
        translate([0, 0, -75])
        rotate([0, 90, 0])
        cylinder(d=di_m4_d, h=100);
        
        translate([50, 0, -65])
        rotate([0, 90, 0])
        cylinder(d=11, h=12, center=true);
        
        translate([0, 0, -10])
        hull() {
            cylinder(d = d1, h = 12.5, $fs=0.5);
            translate([-(l-d2)/2, 0, 0])
            cylinder(d = d2, h = 11.5, $fs=0.5);
            translate([(l-d2)/2, 0, 0])
            cylinder(d = d2, h = 11.5, $fs=0.5);
        }
        
        translate([0, 0, -13])
        hull() {
            cylinder(d = d1, h = 12.5, $fs=0.5);
            translate([-(l-d2)/2-6, 0, 0])
            cylinder(d = d2, h = 11.5, $fs=0.5);
            translate([(l-d2)/2+6, 0, 0])
            cylinder(d = d2, h = 11.5, $fs=0.5);
        }
        translate([0, 0, -14]) {
            translate([(l-d2)/2+7, 0, 0]) {
                cylinder(d=di_m4_d, h=30);
                cylinder(d=di_m4_nut, h=12, $fa=60);
                translate([0, 0, 16]) cylinder(d=8.5, h=10);
            }
            translate([-(l-d2)/2-7, 0, 0]) {
                cylinder(d=di_m4_d, h=30);
                cylinder(d=di_m4_nut, h=12, $fa=60);
                translate([0, 0, 16]) cylinder(d=8.5, h=10);
            }
        }
        
        translate([0, 0, -10])
        cylinder(d=11, h=20);
        
        translate([-90, -20, -137])
        cube([40, 40, 100]);
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
    
    module c1() {
        translate([-35, 0, 0])
        rotate([90, 0, 0])
        cylinder(d=10, h=15, center=true);
    }
    
    module c2() {
        translate([-50, 0, -10])
        rotate([90, 0, 0])
        cylinder(d=10, h=15, center=true);
    }
    
    module c3() {
        translate([-50, 0, -50])
        rotate([0, 90, 0])
        cylinder(d=15, h=10, center=true);
    }
    
    module c4() {
        translate([-50, 0, -65])
        rotate([0, 90, 0])
        cylinder(d=20, h=10, center=true);
    }
    
    module c5() {
        translate([-50, 0, -15])
        rotate([0, 90, 0])
        scale([0.5, 1, 1])
        cylinder(d=15, h=10, center=true);
    }
    
    module c6() {
        translate([-50, 0, -24])
        rotate([0, 90, 0])
        scale([0.1, 1, 1])
        cylinder(d=26, h=10, center=true);
    }
     
    module c7() {
        translate([-50, 0, -75])
        rotate([0, 90, 0])
        cylinder(d=10, h=10, center=true);
    }
}
main();