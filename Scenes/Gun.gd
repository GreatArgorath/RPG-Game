extends Sprite

var gunRotation = get_rotation()

func _process(delta):
	var mpos = get_global_mouse_position()
	look_at(mpos)
	print(gunRotation)

