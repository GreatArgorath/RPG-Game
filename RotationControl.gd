extends Sprite

func _process(delta):
	var mpos = get_global_mouse_position()
	look_at(mpos)

var Bullet = preload("res://Scenes/Bullet.tscn")
var bulletSpeed = 200
var timesShot = 0
	
func shoot():
	if timesShot == 0:
		var b = Bullet.instance()
		b.start(position, rotation)
		get_parent().add_child(b)
		timesShot + 1
	if timesShot == 1:
		pass

func _ready():
	set_process(true)

func _physics_process(delta):
	get_input()

func get_input():
	if Input.is_action_just_pressed("Shoot"):
		shoot()

func test():
	return get_global_transform().get_rotation()
