///scr_enemy_chase_state()

scr_check_for_player();

// change position relative to player 
if(point_distance(x,y, targetx, targety) > spd ){
    var dir = point_direction(x,y, targetx, targety);
    var hspd = lengthdir_x(spd,dir);
    var vspd = lengthdir_y(spd,dir);
    // face the player when chasing
    if(hspd != 0){
        image_xscale = sign(hspd);  //flip depending on x pos
    }
    phy_position_x += hspd;
    phy_position_y += vspd;
}

