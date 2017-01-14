///scr_ani_hit_frame(frame);

var frame = argument0;

// return the exaxt frame of the animation relative to the animation speed
return (image_index >= (frame+1) - image_speed) && (image_index < frame +1);



