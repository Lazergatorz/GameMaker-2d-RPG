///scr_enemy_chase_state()

scr_check_for_player();

// change position relative to player 

phy_position_x += (sign(targetx - x)*spd);
phy_position_y += (sign(targety - y)*spd);
