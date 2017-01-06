///scr_attack_state

image_speed = .5;

// sync attack animation direction with player animation direction
switch(sprite_index){
    case spr_player_right:
        sprite_index = spr_player_attack_right;
        break;
    case spr_player_left:
        sprite_index = spr_player_attack_left;
        break;
    case spr_player_up:
        sprite_index = spr_player_attack_up;
        break;
    case spr_player_down:    
        sprite_index = spr_player_attack_down;
        break;    
}

// deal damage once upon a particular attack anim frame
if(image_index >= 3 && hasattacked == false){
    // offset the damage object relative to dir player is facing
    var xx=0;
    var yy=0;
    switch(sprite_index){
        case spr_player_attack_right:
            xx=x+10;
            yy=y+2;
            break;
        case spr_player_attack_left:
            xx=x-10;
            yy=y+2;
            break;
        case spr_player_attack_up:
            xx=x;
            yy=y-10;
            break;
        case spr_player_attack_down:
            xx=x;
            yy=y+12;
            break;    
    }       
    var damage = instance_create(xx,yy,obj_damage); //instantiate damage object to collide 
    damage.creator = id; // set originator
    hasattacked = true;
}
