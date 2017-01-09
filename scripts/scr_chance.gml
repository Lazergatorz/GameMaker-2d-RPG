///scr_chance(percentage)

// RNG
var percent = argument[0]; // between 0-1
percent = clamp(percent, 0,1); // enforce input to be in the provided range
return (random(1) < percent);






