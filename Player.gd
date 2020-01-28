extends KinematicBody2D
export (int) var speed = 150
var lastDirection = "front"
var velocity = Vector2()
func lastDirection():
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
func aim():
	# Takes rotation value of invisible sprite and changes animation depending on the value.
	if Input.is_action_pressed("Aim"):
		var aimDirection = $Sprite/RotationControl.test()
		if aimDirection < -0.375 and aimDirection > -1.125:
			lastDirection = "RightUp"
		if aimDirection > 0.375 and aimDirection < 1.125:
			lastDirection = "right"
		if aimDirection > -2.71 and aimDirection < -1.9:
			lastDirection = "LeftUp"
		if aimDirection < 2.71 and aimDirection > 1.9:
			lastDirection = "left"
		if aimDirection < -1.125 and aimDirection > -1.9:
			lastDirection = "back"
		if aimDirection > 1.125 and aimDirection < 1.9:
			lastDirection = "front"
func aimMoving():
	if Input.is_action_pressed("Aim"):
		var aimDirection = $Sprite/RotationControl.test()
		if aimDirection < -0.375 and aimDirection > -1.125:
			lastDirection = "rightUp"
		if aimDirection > 0.375 and aimDirection < 1.125:
			lastDirection = "right"
		if aimDirection > -2.71 and aimDirection < -1.9:
			lastDirection = "LeftUp"
		if aimDirection < 2.71 and aimDirection > 1.9:
			lastDirection = "left"
		if aimDirection < -1.125 and aimDirection > -1.9:
			lastDirection = "back"
		if aimDirection > 1.125 and aimDirection < 1.9:
			lastDirection = "front"
func animationCheck():
	# Checks the velocity of the player sprite and changes animation depending on the value
	if velocity.x == 1 and velocity.y == 1:
		aim()
		$Sprite/AnimationPlayer.play("WalkRight")
	if velocity.x == -1 and velocity.y == 1:
		aim()
		$Sprite/AnimationPlayer.play("WalkLeft")
	if velocity.x == 0 and velocity.y == 1:
		aim()
		$Sprite/AnimationPlayer.play("WalkFront")
	if velocity.x == 1 and velocity.y == -1:
		aim()
		$Sprite/AnimationPlayer.play("WalkRightUp")
		lastDirection = "RightUp"
	if velocity.x == -1 and velocity.y == -1:
		aim()
		$Sprite/AnimationPlayer.play("WalkLeftUp")
		lastDirection = "LeftUp"
	if velocity.x == 0 and velocity.y == -1:
		aim()
		$Sprite/AnimationPlayer.play("WalkBack")
	if velocity.x == 1 and velocity.y == 0:
		aim()
		$Sprite/AnimationPlayer.play("WalkRight")
	if velocity.x == -1 and velocity.y == 0:
		aim()
		$Sprite/AnimationPlayer.play("WalkLeft")
	if velocity.x == 0 and velocity.y == 0:
		$Sprite/AnimationPlayer.play()
		lastDirection()
func get_input():
	# Checks for different input and changes velocity depending
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
	aim()
	animationCheck()
	velocity = velocity.normalized() * speed
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)