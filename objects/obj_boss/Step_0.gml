///@description Movement, animation and follow the player

if (active) {
	if (instance_exists(obj_player) == 1 && abs(point_distance(x, y, obj_player.x, obj_player.y)) >= 20)
	{
		// Run or walk depending on distance
		if (abs(point_distance(x, y, obj_player.x, obj_player.y)) >= 40)
		{
			wspeed = (orig_wspeed * 2);
			ispeed = (orig_ispeed * 2);
			if (abs(point_distance(x, y, obj_player.x, obj_player.y)) >= 60)
			{
				wspeed = (orig_wspeed * 3);
				ispeed = (orig_ispeed * 3);
			}
		}
		else
		{
			wspeed = orig_wspeed;
			ispeed = orig_ispeed;
		}
	
		// Movement and animation
		depth = -bbox_bottom;
		direction = point_direction(x, y, obj_player.x, obj_player.y);
		speed = wspeed;
		image_speed = ispeed;	
	}
	// Too close
	else if (abs(point_distance(x, y, obj_player.x, obj_player.y)) < 20)
	{
		// Stop movement and animation
		x = round(x);
		y = round(y);
		speed = 0;
		image_speed = 0;
		image_index = 0;
	}
}

// Facing
if (y > obj_player.y)
	sprite_index = spr_boss_up;
else
	sprite_index = spr_boss_down;