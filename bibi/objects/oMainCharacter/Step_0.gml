/// @description update main character

if (keyboard_check_pressed(vk_escape) or gamepad_button_check(0, gp_select))
{
    game_end();
}

mecUpdate();

fsmExecute();
