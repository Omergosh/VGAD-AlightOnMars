///drawClouds()

var size = ds_list_size(global.clouds);

for (var i = 0; i < size; ++i) {
  var cloud = global.clouds[| i];
  switch (cloud[cloudA.ct]) {
    case clouds.circle:
      var params = cloud[cloudA.cp];
      drawCircleCloud(
        cloud[cloudA.px],
        cloud[cloudA.py],
        params[circleA.radius],
        cloud[cloudA.cd]
      );
      break;
  }
}
