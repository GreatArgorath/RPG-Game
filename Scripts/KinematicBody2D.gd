extends KinematicBody2D
export (int) var speed = 1000
var lastDirection = "front"
var velocity = Vector2()
func animationCheck():
	if velocity.x == 1 and velocity.y == 1:
		$Sprite/AnimationPlayer.play("WalkRight")
	if velocity.x == -1 and velocity.y == 1:
		$Sprite/AnimationPlayer.play("WalkLeft")
	if velocity.x == 0 and velocity.y == 1:
		$Sprite/AnimationPlayer.play("WalkFront")
	if velocity.x == 1 and velocity.y == -1:
		$Sprite/AnimationPlayer.play("WalkRightUp")
		lastDirection = "RightUp"
	if velocity.x == -1 and velocity.y == -1:
		$Sprite/AnimationPlayer.play("WalkLeftUp")
		lastDirection = "LeftUp"
	if velocity.x == 0 and velocity.y == -1:
		$Sprite/AnimationPlayer.play("WalkBack")
	if velocity.x == 1 and velocity.y == 0:
		$Sprite/AnimationPlayer.play("WalkRight")
	if velocity.x == -1 and velocity.y == 0:
		$Sprite/AnimationPlayer.play("WalkLeft")
	if velocity.x == 0 and velocity.y == 0:
		$Sprite/AnimationPlayer.play()
		if lastDirection == "front":
			$Sprite/AnimationPlayer.play("IdleFront")
		if lastDirection == "back":
			$Sprite/AnimationPlayer.play("IdleBack")
		if lastDirection == "left":
			$Sprite/AnimationPlayer.play("IdleLeft")
		if lastDirection == "right":
			$Sprite/AnimationPlayer.play("IdleRight")
		if lastDirection == "LeftUp":
			$Sprite/AnimationPlayer.play("IdleLeftUp")
		if lastDirection == "RightUp":
			$Sprite/AnimationPlayer.play("IdleRightUp")
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('down'):
		velocity.y += 1
		lastDirection = "front"
	if Input.is_action_pressed('up'):
		velocity.y -= 1
		lastDirection = "back"
	if Input.is_action_pressed('right'):
		velocity.x += 1
		lastDirection = "right"
	if Input.is_action_pressed('left'):
		velocity.x -= 1
		lastDirection = "left"
	if Input.is_action_pressed("ui_home"):
		get_tree().quit()
	if Input.is_action_pressed("lookLeft"):
		lastDirection = "left"
	if Input.is_action_pressed("lookRight"):
		lastDirection = "right"
	if Input.is_action_pressed("lookDown"):
		lastDirection = "front"
	if Input.is_action_pressed("lookUp"):
		lastDirection = "back"
	if Input.is_action_pressed("lookLeft") and Input.is_action_pressed("lookUp"):
		lastDirection = "LeftUp"
	if Input.is_action_pressed("lookRight") and Input.is_action_pressed("lookUp"):
		lastDirection = "RightUp"
	animationCheck()
	velocity = velocity.normalized() * speed
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

