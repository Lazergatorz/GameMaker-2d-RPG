///scr_attack_state()

image_speed = .5;

// set sprite directions 
movement = ATTACK;

// render the equipped weapon at the right frame
if(scr_ani_hit_frame(2)){
    var attack_animation = instance_create(x,y, obj_weapon_ani);
    // set the direction of the weapon to the right angle
    attack_animation.dir = facing * 90;
    attack_animation.image_angle = (facing*90)+45;
    attack_animation.sprite_index = weapon_sprite;
}

// deal damage once upon a particular attack anim frame
if(scr_ani_hit_frame(3)){
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
    // TODO : make script for playing the right weapon sounds
    switch(weapon_sprite){
        case spr_sword:
        default:
            audio_play_sound(snd_sword_attack,8,false);         
            break;
        case spr_axe:
            audio_play_sound(snd_axe_attack,8,false);        
            break;
    }
    
    audio_play_sound(snd_sword_attack,8,false);     
    
    var damage = instance_create(xx,yy,obj_damage); //instantiate damage object to collide 
    damage.creator = id; // set originator
    // set damage to current level attack strength
    damage.damage = obj_player_stats.attackstr;

}
