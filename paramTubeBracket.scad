
module tubeBracket(holeCount, glassThickness) {
  width = holeCount * 8;
  spacing = glassThickness + 3;
  thickness = 6;
//  translate([0, 0, width])
//  rotate(90, [0, 1, 0])
  difference() {
    union() {
      // 3 rounded inside corners, 1 square corner
      translate([0, -5, -5]) {
        difference() {
          cube([width, 10 + thickness, 10 + thickness]);
           translate([-1, 11, -1])
            cube([width + 2, 6, 6]);
          translate([-1,0,0])
            rotate(90, [0,1,0])
              cylinder(h=width + 2, r=5, $fn=40);
          translate([-1, 0, 10 + thickness])
            rotate(90, [0,1,0])
              cylinder(h=width + 2, r=5, $fn=40);
          translate([-1, 10 + thickness, 10 + thickness])
            rotate(90, [0,1,0])
              cylinder(h=width + 2, r=5, $fn=40);        
        }
      }
      cube([width, thickness, 22]); // vertical top
      translate([0, -16,0])
        cube([width, 55, thickness]);  // horizontal
      translate([0, 0, -80]) {
        difference() {
          cube([width, thickness, 80]);  // vertical down
          translate([-5,1,-5])
          rotate(40, [1,0,0])
            cube([width + 10, 10, 20]);
        }
      }
      rotate(-5, [1, 0, 0])
        translate([0, spacing + thickness, -75])
        difference() {
          cube([width, thickness, 80]);
          translate([-5,1,-5])
          rotate(40, [1,0,0])
            cube([width + 10, 10, 20]);
        }
      translate([0, spacing + 2*thickness - 2, -5]) {
        difference() {
          cube([width, 7, 6]);
          translate([-1, 6.7, 0])
            rotate(90, [0, 1, 0])
              cylinder(h=width+2, r=5, $fn=40);
        }
      }
    };
    holes(holeCount = holeCount, rotation = 0, translateY = -11, translateZ = -1);
    holes(holeCount = holeCount, rotation = 0, translateY = 33, translateZ = -1);
    holes(holeCount = holeCount, rotation = 90, translateY = 10, translateZ = 17);
  }
}

module holes(holeCount, rotation, translateY, translateZ) {
  for(hole = [1 : holeCount]) {
    translate([hole*8 - 4, translateY, translateZ])
      rotate(rotation, [1, 0, 0])
        cylinder(h=12, r = 2.5, $fn=20);
  }
}


tubeBracket(holeCount = 10, glassThickness = 10);