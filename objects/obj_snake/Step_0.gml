var lr = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
var ud = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

if (abs(lr) xor abs(ud) ) {
	//
	var _ang =  point_direction(0, 0, lr, ud);
	var _x = x + move_distance * dcos(_ang);
	var _y = y - move_distance * dsin(_ang);
	var _can_do = true;
	if (_x < 0 or _x > room_width) { _can_do = false; }
	if (_y < 0 or _y > room_width) { _can_do = false; }
	
	if (_can_do) {
		//saving previous
		previous_x = x;
		previous_y = y;
		previous_ang = direction;
	
		//update angle
		direction = _ang;
		image_angle = _ang;
	
		//move snake head
		x = _x;
		y = _y;
	
		if (instance_exists(my_child)) {
			my_child.body_save_state();
		
			my_child.x = previous_x;
			my_child.y = previous_y;
			my_child.direction = previous_ang;
			my_child.image_angle = previous_ang;
		
			my_child.body_move_child();
		}
	}
	
}
