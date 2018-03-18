///resetLightLevels()

for (var j = 0; j < global.th; ++j) {
  for (var i = 0; i < global.tw; ++i) {
    global.tiles[j, i].light_level = global.default_light_level;
  }
}
