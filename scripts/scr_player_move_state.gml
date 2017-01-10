///scr_player_move_state()

// get inputs

scr_get_input();

// handle interact key/button (formerly dash key)
if (dash_key){   

    // field of player view to check (8 px wide)
    var xdir = lengthdir_x(8, facing*90);
    var ydir = lengthdir_y(8, facing*90);
    var speaker = instance_place(x+xdir, y+ydir, obj_speaker); // check if collision with speaker and return it's id 

    // collided with speaker or dash?    
    if(speaker != noone){
        // we hit a speaker, activate the dialog object        
        with (speaker){
            if(!instance_exists(dialog)){
                // instantiate dialog object at page 0 (default)
                dialog = instance_create(x+xoffset,y+yoffset,obj_dialog);
                dialog.text = text; // set speaker text to dialog
            } else {
                // proceed to next page
                dialog.text_page++;
                dialog.text_count = 0; //next page text starts at beginning
                // make sure we cannot go beyond dialog text page array size
                if(dialog.text_page > array_length_1d(dialog.text)-1){
                    with (dialog) {
                        instance_destroy();
                    }
                }
            }
        }
    } else if(obj_player_stats.stamina >= DASH_COST){
        // we enough stamina (via macro) so dash 
        state = scr_player_dash_state;
        alarm[0] = room_speed/6;  // dash duration 
        // use up stamina for dash
        obj_player_stats.stamina -= DASH_COST;
        // set stamina regen time
        obj_player_stats.alarm[0] = room_speed; 
  }  
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


