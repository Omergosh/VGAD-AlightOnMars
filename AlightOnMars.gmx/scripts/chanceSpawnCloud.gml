///chanceSpawnCloud()

// Delay spawning
if (global.untilCloudSpawn > 0) {
  --global.untilCloudSpawn;
  exit;
}

// The count of current clouds
var count = ds_list_size(global.clouds);

// The threshold to randomly generate another one
var threshold = (count / global.maxClouds) - 0.05;

if (random(1) >= threshold) {
  spawnCloud();
  var cloudPercent = count / global.maxClouds;
  global.untilCloudSpawn = global.cloudSpawnDelay * cloudPercent;
  show_debug_message("Randoming new cloud! Chance: " +
                     string(threshold) + ", clouds: " + string(count)); 
}


