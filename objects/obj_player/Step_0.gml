/// @description Movement, animations, and collisions

// Movement
up_check = keyboard_check(ord("W")) or keyboard_check(vk_up);
left_check = keyboard_check(ord("A")) or keyboard_check(vk_left);
down_check = keyboard_check(ord("S")) or keyboard_check(vk_down);
right_check = keyboard_check(ord("D")) or keyboard_check(vk_right);

xinput =  right_check - left_check
yinput = down_check - up_check

xspd = xinput * move_spd;
yspd = yinput * move_spd;

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
if xspd == 0 and yspd == 0 {image_index = 0};

// Apply
x += xspd;
y += yspd;

// oi adams.... meu nome é carlos.... você assiste................. (Bumda)

