///scr_player_move_state()

// get inputs

scr_get_input();

// check if dashing
if (dash_key){   
    state = scr_player_dash_state;
    alarm[0] = room_speed/6;  // dash duration 
}

// check if attacking
if (attack_key){   
    // reset to frame 0 for attack anim
    image_index = 0;
    state = scr_player_attack_state;    
}

// set the horizontal and vertical speed
hspd = lengthdir_x(len,dir);
vspd = lengthdir_y(len,dir);

// move 
phy_position_x += hspd;
phy_position_y += vspd;

// idle
if(len == 0) image_index = 0;


// determine movement direction in 360
dir = point_direction(0,0,xaxis,yaxis);

// determine movement length
if (xaxis == 0 && yaxis ==0){
    len = 0; //we're standing still
}else{
    len = spd; // we're moving
    // set the direction we're moving for animation
    scr_get_facing();
}

/// control sprites

// anim speed
image_speed = .2;

// determine sprite facing for animation
switch (facing){
    case RIGHT:
        sprite_index = spr_player_right;
        break;
    case UP:
        sprite_index = spr_player_up;
        break;
    case LEFT:
        sprite_index = spr_player_left;
        break;
    case DOWN:    
        sprite_index = spr_player_down;
        break;        
}


