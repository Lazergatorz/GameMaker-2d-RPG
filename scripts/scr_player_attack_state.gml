///scr_attack_state()

image_speed = .5;

// set sprite directions 
movement = ATTACK;

// deal damage once upon a particular attack anim frame
if(image_index >= 3 && hasattacked == false){
    // offset the damage object relative to dir player is facing
    var xx=0;
    var yy=0;
    switch(facing){
        case RIGHT:
            xx=x+10;
            yy=y+2;
            break;
        case LEFT:
            xx=x-10;
            yy=y+2;
            break;
        case UP:
            xx=x;
            yy=y-10;
            break;
        case DOWN:
            xx=x;
            yy=y+12;
            break;    
    }  
    // play attack sound
    audio_play_sound(snd_sword_attack2,8,false);     
    var damage = instance_create(xx,yy,obj_damage); //instantiate damage object to collide 
    damage.creator = id; // set originator
    // set damage to current level attack strength
    damage.damage = obj_player_stats.attackstr;
    hasattacked = true;
}
