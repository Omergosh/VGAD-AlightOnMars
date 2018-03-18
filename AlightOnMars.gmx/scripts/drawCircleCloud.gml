///drawCircleCloud(x, y, radius, darkness)

x0 = argument0;
y0 = argument1;
radius = argument2;
radius2 = radius * radius;
darkness = argument3;

// Naive circle drawing, it's actually square, but we check radius..
for (var j = -radius; j  <= radius; j += 32) {
    yf = y0 + j;
    if (yf < 0 || yf > room_height)
        continue;
    for (var i = -radius; i <= radius; i += 32) {
        xf = x0 + i;
        if (xf < 0 || xf > room_width)
            continue;
        
        if (i * i + j * j > radius2)
            continue;
            
        xt = xf / 32;
        yt = yf / 32;
        global.tiles[yt, xt].light_level -= darkness;
    }
}
