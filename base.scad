// Connecting a servo to the case

module base() {
    difference() {
        union() {
            translate([-49/2, 0, 0])
            p1();
            
            translate([49/2, 0, 0])
            p1();
            
            translate([-30, -15, 0])
            cube([60, 30, 3]);
            
            translate([-10, -30, 0])
            cube([20, 60, 3]);
        }
    }
    
    module p1() {
        translate([0, 0, -27])
        difference() {
            
            translate([4, -10, 0])
            rotate([0, -90, 0])
            linear_extrude(8)
            polygon([[0, 0], [0, 20], [10, 20], [15, 5], [28, 5], [28, -5]]);
            
            
            translate([0, 5, -1]) {
                cylinder(d = 3.5, h = 3.5, $fs=0.4);
                cylinder(d = 2, h = 14, $fs=0.4);
            }
            translate([0, -5, -1]) {
                cylinder(d = 3.5, h = 3.5, $fs=0.4);
                cylinder(d = 2, h = 14, $fs=0.4);
            }
            
        }
    }
}
base();