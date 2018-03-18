///chanceSpawnCloud()

// Delay spawning
if (global.untilCloudSpawn > 0) {
  --global.untilCloudSpawn;
  exit;
}

// The count of current clouds and our ideal count
var count = ds_list_size(global.clouds);
var idealCount = 10;

// The threshold to randomly generate another one
var threshold = (count / idealCount) - 0.05;

if (random(1) >= threshold) {
  spawnCloud();
  global.untilCloudSpawn = global.cloudSpawnDelay;
  show_debug_message("Randoming new cloud! Chance: " +
                     string(threshold) + ", clouds: " + string(count)); 
}


