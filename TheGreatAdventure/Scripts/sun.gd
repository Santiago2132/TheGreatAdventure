extends KinematicBody2D

onready var animation = $AnimationPlayer

func _ready():
	animation.play("sol")

func _process(delta):
	if not animation.is_playing():
		animation.play("sol")
