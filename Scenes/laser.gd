extends Area2D

@export var bullet_speed = 500

func _ready():
	var tween = create_tween()
	tween.tween_property($LaserSprite, 'scale', Vector2(1,1), 0.1).from(Vector2(0.3,0.3))

func _process(delta):
	position.y -= bullet_speed * delta
