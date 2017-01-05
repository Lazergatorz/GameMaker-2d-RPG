///scr_get_input

// pc keyboard
right_key = keyboard_check(ord('D'));
left_key = keyboard_check(ord('A'));
up_key = keyboard_check(ord('W'));
down_key = keyboard_check(ord('S'));
dash_key = keyboard_check_pressed(ord('C'));

// axis
xaxis = (right_key - left_key);
yaxis = (down_key - up_key);


// pc gamepad
if(gamepad_is_connected(0)){
    gamepad_set_axis_deadzone(0, .35);
    xaxis = gamepad_axis_value(0,gp_axislh);
    yaxis = gamepad_axis_value(0,gp_axislv);
    dash_key = gamepad_button_check_pressed(0,gp_face1); // xbox A button
}
