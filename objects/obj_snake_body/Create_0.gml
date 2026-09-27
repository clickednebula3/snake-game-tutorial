image_index = 1;

my_parent = noone;
my_child = noone;

previous_x = x;
previous_y = y;
previous_ang = 0;

length_counter = 0;

function destroy_children() {
	if (instance_exists(my_child)) {
		my_child.destroy_children();
		instance_destroy(my_child);
	}
}

function increment_body() {
	if (instance_exists(my_child)) { my_child.increment_body(); }
	else {
		my_child = instance_create_depth(previous_x, previous_y, depth, obj_snake_body);
		my_child.length_counter = length_counter-1;
		my_child.direction = previous_ang;
		my_child.image_angle = previous_ang;
	}
}

function body_save_state() {
	previous_x = x;
	previous_y = y;
	previous_ang = direction;
}

function body_move_child() {
	if (instance_exists(my_child)) {
		//save
		my_child.body_save_state();
		//update
		my_child.x = previous_x;
		my_child.y = previous_y;
		my_child.direction = previous_ang;
		my_child.image_angle = previous_ang;
		//send signal
		my_child.body_move_child();
	}
}