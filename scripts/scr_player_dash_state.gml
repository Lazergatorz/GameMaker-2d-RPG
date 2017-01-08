///scr_player_dash_state

// dash speed 
len = spd * 4;

// set the horizontal and vertical speed

hspd = lengthdir_x(len,dir);
vspd = lengthdir_y(len,dir);

// move 

phy_position_x += hspd;
phy_position_y += vspd;

// create dash effect
var dash = instance_create(x,y,obj_dash_effect);

// set dash sprite and animation frame to player object's current ones
dash.sprite_index = sprite_index;
dash.image_index = image_index;

