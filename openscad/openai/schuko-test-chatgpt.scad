// Create the base of the case
translate([0, 0, 5]) {
  cube([60, 40, 10]);
}

// Create the sides of the case
translate([0, 0, 15]) {
  cube([60, 40, 10]);
  translate([30, 20, 15]) {
    rotate([0, 90, 0]) {
      cube([60, 40, 10]);
    }
  }
}

// Create the lid of the case
translate([0, 0, 25]) {
  cube([60, 40, 5]);
  translate([30, 20, 25]) {
    rotate([0, 90, 0]) {
      cube([60, 40, 5]);
    }
  }
}

// Create the opening for the OLED display
translate([30, 20, 30]) {
  rotate([0, 90, 0]) {
    cube([25, 15,
