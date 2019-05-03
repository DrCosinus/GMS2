
var h = gamepad_axis_value(0, gp_axislh);

h = sign(h)*clamp((abs(h)-0.4)/(1.0-0.4),0, 1);

return h + (keyboard_check(vk_right)-keyboard_check(vk_left)) + (gamepad_button_check(0,gp_padr)-gamepad_button_check(0,gp_padl));