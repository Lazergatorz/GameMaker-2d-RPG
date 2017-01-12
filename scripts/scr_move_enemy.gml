///scr_move_enemy

// change position relative to target 
var dir = point_direction(0,0, xaxis, yaxis);
var hspd = lengthdir_x(spd,dir);
var vspd = lengthdir_y(spd,dir);
if(hspd != 0){
    image_xscale = sign(hspd);  //flip depending on x pos
}
scr_get_facing(dir);
movement = MOVE;
phy_position_x += hspd;
phy_position_y += vspd;


