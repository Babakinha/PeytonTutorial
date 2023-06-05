/// @description Movement, animation and follow the player

if active
{
	// Movement, facing
	if (instance_exists(obj_player) == 1 && abs(point_distance(x, y, obj_player.x, obj_player.y)) >= 20)
	{
		// Get distance to player
		mydist = abs(point_distance(x, y, obj_player.x, obj_player.y));
		
		// Walk or run depending on distance
		if (mydist < 40)
		{
			wspeed = orig_wspeed;
			ispeed = orig_ispeed;
		}
		else
		{
			wspeed = (orig_wspeed * round(mydist / 20));
			ispeed = (orig_ispeed * round(mydist / 20));
		}
	
		// Movement
		speed = wspeed;
		direction = point_direction(x, y, obj_player.x, obj_player.y);
		
		// Basic collision
		if (place_meeting((x + hspeed), y, obj_wall) == 1)
			hspeed = 0;
		if (place_meeting(x, (y + vspeed), obj_wall) == 1)
			vspeed = 0;
			
		// Animation
		if (hspeed != 0 && vspeed != 0)
		{
			depth = -bbox_bottom;
			image_speed = ispeed;
			if (moving == 0)
				image_index = 1;
			moving = 1;
		}
		
		// Facing
		if (abs(x - obj_player.x) > abs(y - obj_player.y))
		{
			if (x > obj_player.x)
				sprite_index = spr_boss_left;
			else
				sprite_index = spr_boss_right;
		}
		else
		{
			if (y > obj_player.y)
				sprite_index = spr_boss_up;
			else
				sprite_index = spr_boss_down;
		}
	}
	// Stop movement and animation if its too close or obj_player doesn't exists
	else
	{
		x = round(x);
		y = round(y);
		speed = 0;
		image_speed = 0;
		image_index = 0;
		moving = 0;
	}
}