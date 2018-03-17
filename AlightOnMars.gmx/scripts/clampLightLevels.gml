///clampLightLevels()

min_ll = global.min_light_level;
max_ll = global.max_light_level;

for (var j = 0; j < global.th; ++j) {
    for (var i = 0; i < global.tw; ++i) {
        var ll = global.tiles[j, i].light_level;
        if (ll < min_ll)
            global.tiles[j, i].light_level = min_ll;
        else if (ll > max_ll)
            global.tiles[j, i].light_level = max_ll;
    }
}
