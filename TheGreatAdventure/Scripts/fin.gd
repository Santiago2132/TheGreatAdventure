extends KinematicBody2D

const moveSpeed = 25
const maxSpeed = 100

const jumpHeight = -300
const up = Vector2(0,-1)
const gravity = 14

onready var sprite = $Sprite
onready var animation = $AnimationPlayer

var motion = Vector2()

func _physics_process(delta):
	
	motion.y += gravity
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = false
		animation.play("caminar")
		motion.x = clamp(motion.x + moveSpeed, 0, maxSpeed)
	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h = true
		animation.play("caminar")
		motion.x = clamp(motion.x - moveSpeed, -maxSpeed, 0)
	else:
		animation.play("normal")
		friction = true
	
	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			motion.y = jumpHeight
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.1)
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
	motion = move_and_slide(motion,up)
