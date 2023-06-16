extends KinematicBody2D

const MOVE_SPEED = 25
const MAX_SPEED = 50
const JUMP_HEIGHT = 300
const UP = Vector2(0, 1)
const GRAVITY = 15

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer

var motion = Vector2()

# Función para mover al personaje
func move_character(delta):
	# Aplica la gravedad
	motion.y += GRAVITY * delta

	var friction = false

	# Movimiento horizontal
	if Input.is_action_just_pressed("ui_right"):
		sprite.flip_h = false
		animationPlayer.play("walk")
		motion.x = clamp(motion.x + MOVE_SPEED, -MAX_SPEED, MAX_SPEED)
	elif Input.is_action_just_pressed("ui_left"):
		sprite.flip_h = true
		animationPlayer.play("walk")
		motion.x = clamp(motion.x - MOVE_SPEED, -MAX_SPEED, MAX_SPEED)
	else:
		animationPlayer.play("Idle")
		friction = true

	# Salto
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			motion.y = -JUMP_HEIGHT
	else:
		friction = true

	# Fricción
	if friction:
		motion.x = lerp(motion.x, 0, 0.1)

	# Movimiento y detección de colisiones
	motion = move_and_slide(motion, UP)

# Función para actualizar el personaje
func _physics_process(delta):
	move_character(delta)
