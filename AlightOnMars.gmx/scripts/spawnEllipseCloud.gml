///spawnCloud()

show_debug_message("Spawning ellipse");

// Cloud range params

var majRadiusMin = 5 * 32;
var majRadiusMax = 9 * 32;
var minRadiusMin = 2 * 32;
var minRadiusMax = 5 * 32;

// Cloud size info
var xradius;
var yradius;
if (irandom(1)) {
  xradius = irandom(majRadiusMax - majRadiusMin) + majRadiusMin;
  yradius = irandom(minRadiusMax - minRadiusMin) + minRadiusMin;
}
else {
  xradius = irandom(minRadiusMax - minRadiusMin) + minRadiusMin;
  yradius = irandom(majRadiusMax - majRadiusMin) + majRadiusMin;
}

// Cloud position
var side = irandom(3);
var hpos; // Position on horizontal
var vpos; // Position on vertical

// Put us radius distance outside the side chosen, and then on the opposing
// axis somewhere in one fifth of the distance outside of the axis
switch (side) {
  case dir.north:
    hpos = irandom(room_width * 1.4) - (room_width * .2);
    vpos = -yradius;
    break;
  case dir.east:
    hpos = room_width + xradius;
    vpos = irandom(room_height * 1.4) - (room_height * .2);
    break;
  case dir.south:
    hpos = irandom(room_width * 1.4) - (room_width * .2);
    vpos = room_height + yradius;
    break;
  case dir.west:
    hpos = -xradius;
    vpos = irandom(room_height * 1.4) - (room_width * .2);
    break;
}

// Select a bearing to some point in the middle of the room. "Middle" is chosen
// by lopping off a tenth on each side of the room and generating a point in
// that new box.
var bx = irandom(room_width * .8) + (room_width * .1);
var by = irandom(room_height * .8) + (room_width * .1);

// Differencing to find speed
var dx = bx - hpos;
var dy = by - vpos;
var theta = arctan2(dy, dx);

// Generate speed
var minSpeed = 32 * .05;
var maxSpeed = 32 * .1;
var vecSpeed = random(maxSpeed - minSpeed) + minSpeed;
var vx = cos(theta) * vecSpeed;
var vy = sin(theta) * vecSpeed;

// Pick darkness
var minDarkness = 12;
var maxDarkness = 40;
var darkness = irandom(maxDarkness - minDarkness) + minDarkness;

var params = array(xradius, yradius);
var cloud = array(
  hpos,
  vpos,
  vx,
  vy,
  clouds.ellipse,
  darkness,
  params
);
ds_list_add(global.clouds, cloud);
