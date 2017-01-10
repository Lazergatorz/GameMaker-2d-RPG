///scr_save_game()

if(!instance_exists(obj_player_stats)){
    exit;
}

// save data structure
var save_data = ds_map_create();
with (obj_player_stats){  
    save_data[? "room"] = previous_room;
    save_data[? "x"] = 0;
    save_data[? "y"] = 0;
    save_data[? "hp"] = hp;
    save_data[? "maxhp"] = maxhp;
    save_data[? "stamina"] = stamina;
    save_data[? "maxstamina"] = maxstamina;
    save_data[? "xp"] = xp;
    save_data[? "maxxp"] = maxxp;
    save_data[? "level"] = level;
    save_data[? "attackstr"] = attackstr;
}
// covert to json string for writing
var save_string = json_encode(save_data);
// encode it 
save_string = base64_encode(save_string);
// cleanup
ds_map_destroy(save_data);
// write to disc
var file = file_text_open_write(working_directory + "MySaveGame.txt");
file_text_write_string(file, save_string);
file_text_close(file);
show_message("Game saved");
