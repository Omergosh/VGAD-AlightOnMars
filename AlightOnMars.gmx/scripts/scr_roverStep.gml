// Player character script (rover)
/*
Variable list...
acceleration;
maxSpeed = 10, currentSpeed = 3;
maxTurnSpeed = 10, turnSpeed = 2;
maxSolarPower = 1000, currentSolarPower = 0;
*/

//Keyboard inputs
//(motion lock)
if(keyboard_check_pressed(vk_space)){
    if(motionLock == true){
        motionLock = false;
    }else{
        motionLock = true;
    }
}
//(turning)
if keyboard_check(vk_left){
    turnSpeed += 5;
}
if keyboard_check(vk_right){
    turnSpeed -= 5;
}
if(motionLock == false){
    if(keyboard_check(vk_left)==false and keyboard_check(vk_right)==false){
        if(turnSpeed>turnFriction){
            turnSpeed -= turnFriction;
        }else if(turnSpeed<-turnFriction){
            turnSpeed += turnFriction;
        }else{
            turnSpeed = 0;
        }
    }
}
turnSpeed = clamp(turnSpeed, -maxTurnSpeed, maxTurnSpeed);
//(acceleration)
if keyboard_check(vk_up){
    currentSpeed += acceleration;
}else if keyboard_check(vk_down){
    currentSpeed -= acceleration;
}else if(motionLock == false){
    if(currentSpeed>1){
        currentSpeed--;
    }else if(currentSpeed<-1){
        currentSpeed++;
    }else{
        currentSpeed = 0;
    }
}
currentSpeed = clamp(currentSpeed, -maxSpeed, maxSpeed);

//Physics/changes
direction += turnSpeed;
speed = currentSpeed;
image_angle = round(direction);

//Screen wrapping (manual)
if(x - sprite_width > room_width){
    x = -sprite_width;
}else if(x + sprite_width < 0){
    x = room_width + sprite_width;
}
if(y - sprite_height > room_height){
    y = -sprite_height;
}else if(y + sprite_height < 0){
    y = room_height + sprite_height;
}

//Helper functions

