// Player character script (rover)
/*
Variable list...
acceleration;
maxSpeed = 10, currentSpeed = 3;
maxTurnSpeed = 10, turnSpeed = 2;
*/

// Tracks if we're moving
var moving = false;

//Animation
image_index = 0;

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
    moving = true;
}
if keyboard_check(vk_right){
    turnSpeed -= 5;
    moving = true;
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
    moving = true;
    //Animation
    image_index = 1;
}else if keyboard_check(vk_down){
    currentSpeed -= acceleration;
    moving = true;
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

// Check if we're moving and motion lock is on
if (motionLock && (currentSpeed != 0 || turnSpeed != 0)) {
  moving = true;
  //Animation
  image_index = 2;
}

// Spend energy to move
var toSpend;
if (moving) {
  toSpend = 5*1.5 * (speed / maxSpeed);
}
// Spend less energy to stay still
else {
  toSpend = 3*.3;
}

// We can only spend down to 0
if (global.currentSolar - toSpend > 0)
  global.currentSolar -= toSpend;
else
  global.currentSolar = 0;

//Physics/changes
// Remove control if we don't have power
if (global.currentSolar > 0) {
  direction += turnSpeed;
  speed = currentSpeed;
  image_angle = round(direction);
}
else {
  speed = clamp(speed - acceleration, 0, maxSpeed);
  image_angle = round(direction);
  //Animation
  image_index = 3;
}

//Screen wrapping (manual)
if(x  > room_width){
    x = 0;
}else if(x < 0){
    x = room_width;
}
if(y > room_height){
    y = 0;
}else if(y < 0){
    y = room_height;
}

//Helper functions

