///scr_player_move_state()

// set player sprite set

movemenet = MOVE;

// handle interact key/button (formerly dash key)
if (obj_input.dash_key){   

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


// handle ranged key
if (obj_input.ranged_key){   
    // create projectile
    var p = instance_create(x,y, obj_projectile);
    // speed and direction of projectile
    var xforce = lengthdir_x(7, facing*90);
    var yforce = lengthdir_y(7, facing*90);
    // set creator
    p.creator = id;  
    // shoot (apply force) to projectile
    with(p){
        physics_apply_impulse(x,y,xforce,yforce);
    }
}

// handle attack key
if (obj_input.attack_key){   
    
    // reset to frame 0 for attack anim
    image_index = 0;
    state = scr_player_attack_state;    
}


// handle swap key
if (obj_input.swap_key){   
    // pick up the item on the ground near to us... 
    var nearest_weapon = instance_nearest(x,y,obj_weapon_item);
    //...if we're next to it and close enough to collide with it
    if(place_meeting(x,y+4,nearest_weapon )){
        scr_swap_weapons(nearest_weapon);
    }        
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
dir = point_direction(0,0,obj_input.xaxis,obj_input.yaxis);

// determine movement length
if (obj_input.xaxis == 0 && obj_input.yaxis ==0){
    len = 0; //we're standing still
}else{
    len = spd; // we're moving
    // set the direction we're moving for animation
    scr_get_facing(dir);
}

/// control sprites

// anim speed
image_speed = .2;

