///drawCircleCloud(x, y, crad, yrad darkness)

x0 = argument0;
y0 = argument1;
xrad = argument2;
xrad2 = xrad * xrad;
yrad = argument3;
yrad2 = yrad * yrad;
darkness = argument4;

// Naive circle drawing, it's actually square, but we check radius..
for (var j = -yrad; j  <= yrad; j += 32) {
    yf = y0 + j;
    if (yf < 0 || yf >= room_height)
        continue;
    for (var i = -xrad; i <= xrad; i += 32) {
        xf = x0 + i;
        if (xf < 0 || xf >= room_width)
            continue;
        
        if ((i * i) / xrad2 + (j * j) / yrad2 > 1)
            continue;
            
        xt = xf / 32;
        yt = yf / 32;
        global.tiles[yt, xt].light_level -= darkness;
    }
}
