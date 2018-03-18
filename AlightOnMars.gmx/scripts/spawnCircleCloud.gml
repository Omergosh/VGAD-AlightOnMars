///spawnCircleCloud()

// Cloud range params
var radiusMin = 5 * 32;
var radiusMax = 9 * 32;

// Cloud size info
var radius = irandom(radiusMax - radiusMin) + radiusMin;

// Cloud position
var side = irandom(3);
var hpos; // Position on horizontal
var vpos; // Position on vertical

// Put us radius distance outside the side chosen, and then on the opposing
// axis somewhere in one fifth of the distance outside of the axis
switch (side) {
  case dir.north:
    hpos = irandom(room_width * 1.4) - (room_width * .2);
    vpos = -radius;
    break;
  case dir.east:
    hpos = room_width + radius;
    vpos = irandom(room_height * 1.4) - (room_height * .2);
    break;
  case dir.south:
    hpos = irandom(room_width * 1.4) - (room_width * .2);
    vpos = room_height + radius;
    break;
  case dir.west:
    hpos = -radius;
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

var params = array(radius);
var cloud = array(
  hpos,
  vpos,
  vx,
  vy,
  clouds.circle,
  darkness,
  params
);
ds_list_add(global.clouds, cloud);
