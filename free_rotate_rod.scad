include <config.scad>
module free_rotate_rod() {
    union() {
        cylinder(d=10, h=15);
        cylinder(d=9.8, h=25, $fa=70);
    }
}
free_rotate_rod();