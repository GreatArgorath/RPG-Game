extends Sprite
var Bullet = preload("res://Scenes/Bullet.tscn")
export var bullet_speed = 1000

func _process(delta):
	var mpos = get_global_mouse_position()
	look_at(mpos)
	

func _ready():
	set_process(true)

func test():
	return get_global_transform().get_rotation()