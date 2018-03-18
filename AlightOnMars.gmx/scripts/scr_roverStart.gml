///scr_roverStart
acceleration = 1.5;
maxSpeed = 25;
currentSpeed = 3;
moveFriction = 1;
maxTurnSpeed = 10;
turnSpeed = 1;
turnFriction = 0.7;
maxSolarPower = 1000;
currentSolarPower = 0;
motionLock = false;

//Pick a spawn point within established bounds
valid_rspawn = false;
rspawn_x = 0;
rspawn_y = 0;
while(valid_rspawn == false){
    rspawn_x = sprite_width/2 + irandom(room_width-sprite_width);
    rspawn_y = sprite_width/2 + irandom(room_height-sprite_height);
    if(!collision_rectangle(rspawn_x-(sprite_width/2)-32, rspawn_y-(sprite_height/2)-32, rspawn_x+(sprite_width/2)+32, rspawn_y+(sprite_height/2)+32, obj_rock, false, true)){
        valid_rspawn = true;
    }
}
x = rspawn_x;
y = rspawn_y;
