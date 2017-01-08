///scr_check_for_player()

// sets enemy state based upon player presence and vicinity

if(instance_exists(obj_player)){
    // if player is in room , get the distance to player
    var dis = point_distance(x,y,obj_player.x,obj_player.y);
    // check if player is within aggro range, set to chase
    if (dis < sight){
        state = scr_enemy_chase_state;
        spd = 1.5;
        targetx = obj_player.x;
        targety = obj_player.y;
    } else {
        // set to either idle or wander
        spd = .5;
        scr_enemy_choose_next_state();
    }
} else {
    // set to either idle or wander
    spd = .5;
    scr_enemy_choose_next_state();
}
