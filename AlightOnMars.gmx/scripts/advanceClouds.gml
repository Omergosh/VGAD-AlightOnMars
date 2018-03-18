///advanceClouds()

var size = ds_list_size(global.clouds);

for (var i = 0; i < size; ++i) {
  var cloud = global.clouds[| i];
  cloud[cloudA.px] += cloud[cloudA.vx];
  cloud[cloudA.py] += cloud[cloudA.vy];
  global.clouds[| i] = cloud;
}
