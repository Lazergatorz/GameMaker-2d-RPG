///scr_player_dash_state

// dash speed 
len = spd * 4;

// set the horizontal and vertical speed

hspd = lengthdir_x(len,dir);
vspd = lengthdir_y(len,dir);

// move 

phy_position_x += hspd;
phy_position_y += vspd;

