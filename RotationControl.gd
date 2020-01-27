extends Sprite

func _process(delta):
	var mpos = get_global_mouse_position()
	look_at(mpos)

func _ready():
	set_process(true)

func test():
	return get_global_transform().get_rotation()