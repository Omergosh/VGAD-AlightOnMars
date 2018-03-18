///drawClouds()

var size = ds_list_size(global.clouds);

for (var i = 0; i < size; ++i) {
  var cloud = global.clouds[| i];
  var params = cloud[cloudA.cp];
  switch (cloud[cloudA.ct]) {
    case clouds.circle:
      drawCircleCloud(
        cloud[cloudA.px],
        cloud[cloudA.py],
        params[circleA.radius],
        cloud[cloudA.cd]
      );
      break;
    case clouds.ellipse:
      drawEllipseCloud(
        cloud[cloudA.px],
        cloud[cloudA.py],
        params[ellipseA.xradius],
        params[ellipseA.yradius],
        cloud[cloudA.cd]
      );
      break;
  }
}
