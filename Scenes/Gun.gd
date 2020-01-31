extends Sprite

var gunRotation = get_transform().get_rotation()

func _process(delta):
	var mpos = get_global_mouse_position()
	look_at(mpos)
	if gunRotation > -1.5 and gunRotation < 1.5:
		set_flip_v(true)
	else:
		set_flip_v(false)
