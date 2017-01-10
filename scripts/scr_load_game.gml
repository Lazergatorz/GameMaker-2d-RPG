///scr_load_game()

// open the save file and read to string
var file = file_text_open_read(working_directory + "MySaveGame.txt");
var save_string = file_text_read_string(file);
file_text_close(file);
// decode
save_string = base64_decode(save_string);
// get json data
var save_data = json_decode(save_string);


var save_room = save_data[? "room"];

// set room to saved ones
if(room != save_room){
    room_goto(save_room);
}

// get saved player position and stats and set
with(obj_player_stats){
    // player position
    player_xstart = save_data[? "x"]; 
    player_ystart = save_data[? "y"]; 
    if(instance_exists(obj_player)){
        obj_player.x = player_xstart;
        obj_player.y = player_ystart;
        obj_player.phy_position_x = player_xstart;
        obj_player.phy_position_y = player_ystart;           
    } else {
        instance_create(player_xstart,player_ystart,obj_player);
    }
    hp = save_data[? "hp"]; 
    maxhp = save_data[? "maxhp"]; 
    stamina = save_data[? "stamina"]; 
    maxstamina = save_data[? "maxstamina"]; 
    xp = save_data[? "xp"]; 
    maxxp = save_data[? "maxxp"]; 
    level = save_data[? "level"]; 
    attackstr = save_data[? "attackstr"]; 
}

//cleanup
ds_map_destroy(save_data);
