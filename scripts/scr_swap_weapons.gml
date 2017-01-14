///scr_swap_weapons(new_weapon);

var new_weapon = argument0;

// swap sprites
var temp = weapon_sprite; // current
weapon_sprite = new_weapon.sprite_index;
new_weapon.sprite_index = temp;


