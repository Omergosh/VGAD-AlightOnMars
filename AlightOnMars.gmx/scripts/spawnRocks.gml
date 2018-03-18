//How much the screen is covered with rocks, in terms of tiles filled by rocks.
//A given value multiplied by 0.2, for example, would cover 20% of the screen
spawn_area_offset = 1;
rock_rate = 0.15;

//Number of tiles across and high for spawn area (centered around room center)
tiles_across = (room_width/32) - (spawn_area_offset*2);
tiles_high = (room_height/32) - (spawn_area_offset*2);
tiles_to_occupy = tiles_across*tiles_high;
tiles_to_occupy = floor(tiles_to_occupy*rock_rate);
tiles_occupied = 0;

//[Random generation]
//Spawn rocks until ratio is satisfied
while(tiles_occupied < tiles_to_occupy){
    //Pick a spawn point within established bounds
    valid_spawn = false;
    spawn_x = 0;
    spawn_y = 0;
    while(valid_spawn == false){
        spawn_x = spawn_area_offset + irandom(tiles_across-1);
        spawn_y = spawn_area_offset + irandom(tiles_high-1);
        if(!collision_rectangle((spawn_x-1)*32, (spawn_y-1)*32, (spawn_x+2)*32, (spawn_y+2)*32, obj_rock, false, true)){
            valid_spawn = true;
        }
    }
    //Decide size of rock
    size_valid = false;
    size_x = 1;
    size_y = 1;
    size_1 = 1;
    size_2 = 1;
    max_size = 5;
    max_size = min(max_size, tiles_to_occupy - tiles_occupied);
    show_debug_message(spawn_area_offset + tiles_across - (spawn_x));
    max_size_x = spawn_area_offset + tiles_across - (spawn_x);
    max_size_y = tiles_high + spawn_area_offset - spawn_y - size_y;
    if(max_size_x<max_size){
        //max_size = max_size_x;
    }
    max_size = max(max_size, 1);
    
    //Keep rolling the dice until we get a rock with breathing room around its spawn
    while(size_valid == false){
        //Randomize two size integers
        size_1 = irandom(max_size-1)+1;
        size_2 = irandom(max_size-size_1)+1;
        while(size_1*size_2<max_size){
            size_2 = irandom(max_size-size_1)+1;
        }
        //Randomly assign determined values to rock width and height
        if(round(random(1))){
            size_x = size_1;
            size_y = size_2;
        }else{
            size_x = size_2;
            size_y = size_1;
        }
        //Check if a rock of this size fits nicely
        if(!collision_rectangle((spawn_x-1)*32, (spawn_y-1)*32, (spawn_x+size_x+1)*32, (spawn_y+size_y+1)*32, obj_rock, false, true)){
            size_valid = true;
        }
    }
    //Once rock details are finalized, spawn the rock and increment values
    var rock;
    rock = instance_create(spawn_x*32, spawn_y*32, obj_rock);
    rock.image_xscale = size_x;
    rock.image_yscale = size_y;
    tiles_occupied += size_x*size_y;
}
