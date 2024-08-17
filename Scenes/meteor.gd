extends Area2D

var meteor_speed: int
var meteor_rotation: int
var meteor_direction: float
var destroyable: bool

signal collision

func _ready():
	var rng := RandomNumberGenerator.new()
	
	# randomize spawn position
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	position = Vector2(random_x, -50)
	
	# randomize speed
	meteor_rotation = rng.randi_range(-5, 5)
	# randomize rotation
	meteor_speed = rng.randi_range(150, 450)
	# randomize direction
	meteor_direction = rng.randf_range(-0.5, 0.5)
	# randomize texture
	var number = randi_range(1,8)
	var path = "res://Sprites/Meteors/" + str(number) + ".png"
	$MeteorSprite.texture = load(path)
	# make grey meteors invincible
	if number < 5:
		destroyable = true
	else:
		destroyable = false
	
func _process(delta):
	position += Vector2(meteor_direction, 1) * delta * meteor_speed
	rotate(meteor_rotation * delta)

func _on_body_entered(_body):
	collision.emit()

func _on_area_entered(area):
	area.queue_free()
	if destroyable:
		queue_free()
