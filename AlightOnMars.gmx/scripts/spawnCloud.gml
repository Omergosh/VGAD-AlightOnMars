/// spawnCloud()

// Define for use in later spawning scripts
enum dir {
  north = 0,
  east = 1,
  south = 2,
  west = 3
}

// Random a type of cloud
var type = irandom(clouds.end_cloud - 1);
switch (type) {
  case clouds.circle: spawnCircleCloud(); break;
  case clouds.ellipse: spawnEllipseCloud(); break;
}
