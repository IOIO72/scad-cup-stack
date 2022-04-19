
// Input the diameter of your cup
cup_diameter = 83.5;

// Input the inner diameter of your cup (must be smaller than the cup diameter)
inner_cup_diameter = 72.0;

// Change the holder height, if necessary
holder_height = 10;

// Change the bottom holder height, if necessary
holder_height_bottom = 10;

/* [Hidden] */

// Thickness of the walls
wall_thickness = 2;
// Height of the middle plate
plate_height = 2;

module ring(height,diameter,inner_diameter) {
  linear_extrude(height=height, center = true) {
    difference () {
      circle(d=diameter);
      circle(d=inner_diameter);
    };
  };
};

// Upper Holder
translate([0,0,(plate_height + holder_height) / 2]) {
  ring(holder_height, cup_diameter + wall_thickness, cup_diameter);
};

// Middle plate
ring(plate_height, cup_diameter + wall_thickness, inner_cup_diameter - wall_thickness);

// Inside Holder
translate([0,0,-(plate_height + holder_height_bottom) / 2]) {
  ring(holder_height_bottom, inner_cup_diameter, inner_cup_diameter - wall_thickness);
};
