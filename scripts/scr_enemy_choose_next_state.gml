///scr_enemy_choose_next_state()

// randomly choose between idling or wandering and reset to random interval
if (alarm[0] <=0){
    state = choose(scr_enemy_wander_state, scr_enemy_idle_state);
    alarm[0] = room_speed*irandom_range(2,4);
    // set enemy direction randomly
    if (state == scr_enemy_wander_state){
        xaxis = random_range(-1,1);
        yaxis = random_range(-1,1);
    }   
}    


