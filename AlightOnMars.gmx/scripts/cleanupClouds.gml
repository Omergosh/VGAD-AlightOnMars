///cleanupClouds()

// Cloud count
var count = ds_list_size(global.clouds);

// The list of indices of clouds to remove because they will no longer be
// rendered
var toDestroy = ds_list_create();

// Iterate through in REVERSE order so that we can iterate forward over the
// destroy list and not have indices affected by deletion
for (var i = count - 1; i >= 0; --i) {
  var cloud = global.clouds[| i];
  var cx = cloud[cloudA.px];
  var cy = cloud[cloudA.py];
  var ct = cloud[cloudA.ct];
  var cp = cloud[cloudA.cp];
  
  switch(ct) {
    case clouds.circle:
      var rad = cp[circleA.radius];
      if (cx + rad < 0 || cx - rad > room_width ||
          cy + rad < 0 || cy - rad > room_height) {
        ds_list_add(toDestroy, i);
      }
      break;
    case clouds.ellipse:
      var xrad = cp[ellipseA.xradius];
      var yrad = cp[ellipseA.yradius];
      if (cx + xrad < 0 || cx - xrad > room_width ||
          cy + yrad < 0 || cy - yrad > room_height) {
        ds_list_add(toDestroy, i);
      }
  }
}

// Remove the clouds. Remember that we're dropping from the end of the list
// backwards meaning that all of our future destruction indices are still
// valid
for (var i = 0; i < ds_list_size(toDestroy); ++i) {
  show_debug_message("Destroying cloud: " + string(toDestroy[| i]));
  ds_list_delete(global.clouds, toDestroy[| i]);
}


ds_list_destroy(toDestroy);
