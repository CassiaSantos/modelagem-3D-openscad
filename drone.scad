shell=0.8;

//compartimento do motor

difference() {
  cylinder(d=7 + 2 * shell, h=16.5);
  translate([0, 0, shell])
    cylinder(d=7,  h=16.5);
}