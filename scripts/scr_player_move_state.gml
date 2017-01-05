///scr_player_move_state

// get inputs

scr_get_input();

// check if dashing
if (dash_key){   
    state = scr_player_dash_state;
    alarm[0] = room_speed/7;  // dash duration 
}

// determine movement direction in 360

dir = point_direction(0,0,xaxis,yaxis);

// determine movement length

if (xaxis == 0 && yaxis ==0){
    len = 0; //we're standing still
}else{
    len = spd; // we're moving
}

// set the horizontal and vertical speed

hspd = lengthdir_x(len,dir);
vspd = lengthdir_y(len,dir);

// move 

phy_position_x += hspd;
phy_position_y += vspd;

/// control sprites
 
// anim speed
image_speed = .2;

// idle
if(len == 0) image_index = 0;

// vertical sprites
if (vspd > 0){
    sprite_index = spr_player_down; 
} else if (vspd < 0 ){
    sprite_index = spr_player_up;
}

// horizontal sprites
if (hspd > 0){
    sprite_index = spr_player_right; 
} else if (hspd < 0 ){
    sprite_index = spr_player_left;
}

