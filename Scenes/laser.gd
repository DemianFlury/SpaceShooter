extends Area2D

@export var bullet_speed = 500

func _process(delta):
	position.y -= bullet_speed * delta
