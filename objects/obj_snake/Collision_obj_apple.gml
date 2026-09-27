//relocate apple
var _x = 64*floor(irandom_range(0, room_width-1)/64);
var _y = 64*floor(irandom_range(0, room_height-1)/64);
other.x = _x;
other.y = _y;



length_counter+=1;

if (length_counter <= 1) {
	if (instance_exists(my_child)) {
		my_child.destroy_children();
		instance_destroy(my_child);
	}
	my_child = instance_create_depth(previous_x, previous_y, depth, obj_snake_body);
	my_child.length_counter = length_counter-1;
	my_child.direction = previous_ang;
	my_child.image_angle = previous_ang;

} else {
	my_child.increment_body();
	//update previous
}