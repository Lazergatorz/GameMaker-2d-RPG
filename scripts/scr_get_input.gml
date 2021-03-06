///scr_get_input()


// TODO : make keyboard and gamepad work simultaneously by writing abstraction layer

// pc keyboard
right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);
dash_key = keyboard_check_pressed(ord('C'));
attack_key = keyboard_check_pressed(ord('X'));
ranged_key = keyboard_check_pressed(ord('V'));
swap_key = keyboard_check_pressed(ord('Z'));
pause_key = keyboard_check_pressed(vk_escape);


// axis
xaxis = (right_key - left_key);
yaxis = (down_key - up_key);


// pc gamepad
if(gamepad_is_connected(0)){
    gamepad_set_axis_deadzone(0, .35);
    xaxis = gamepad_axis_value(0,gp_axislh);
    yaxis = gamepad_axis_value(0,gp_axislv);
        
    dash_key = gamepad_button_check_pressed(0,gp_face1); // xbox A button
    attack_key = gamepad_button_check_pressed(0,gp_face3); // xbox X button    
    ranged_key = gamepad_button_check_pressed(0,gp_face4); // xbox Y button
    swap_key = gamepad_button_check_pressed(0,gp_face2); // xbox B button
    pause_key = gamepad_button_check_pressed(0,gp_start); // xbox start button

}
