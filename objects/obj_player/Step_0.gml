/// @description Movement, animations, and collisions

#region Movement, animations and collisions

// Get inputs
up_check = keyboard_check(ord("W")) or keyboard_check(vk_up);
left_check = keyboard_check(ord("A")) or keyboard_check(vk_left);
down_check = keyboard_check(ord("S")) or keyboard_check(vk_down);
right_check = keyboard_check(ord("D")) or keyboard_check(vk_right);
run_check = keyboard_check(ord("X")) or keyboard_check(vk_shift);
fart_check = keyboard_check_pressed(ord("F"));

// Set apparent movement speed
xinput = (right_check - left_check);
yinput = (down_check - up_check);

// Get actual movement speed
if (run_check)
	move_spd = (orig_move_spd * 2);
else if !(run_check)
	move_spd = orig_move_spd;

xspd = (xinput * move_spd);
yspd = (yinput * move_spd);

// Collision
if place_meeting(x + xspd, y, obj_wall) {xspd = 0};
if place_meeting(x , y + yspd, obj_wall) {yspd = 0};

// Animations
if yinput == 0 {
	if xinput > 0 {face = RIGHT};
	if xinput < 0 {face = LEFT};
}
if xinput == 0 {
	if yinput > 0 {face = DOWN};
	if yinput < 0 {face = UP};
}
sprite_index = sprite[face];
image_speed = run_check + 1;
if xspd == 0 and yspd == 0 {image_index = 0};

// Apply
x += xspd;
y += yspd;

#endregion

// Depth
depth = -bbox_bottom

// Fart
if fart_check
	audio_play_sound(snd_fart, 0, false)


