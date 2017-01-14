///scr_enemy_wound_sound(enemy);

switch(argument[0]){
    case "Slime" :
        audio_play_sound(snd_slime_attack,9,false);   
        break;
    case "Chinlin" :
        audio_play_sound(snd_chinlin_attack,9,false);   
        break;
}
