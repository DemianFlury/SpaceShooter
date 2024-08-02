extends Area2D

var meteor_speed: int
var meteor_rotation: int
var meteor_direction: float

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
	var path = "res://Sprites/Meteors/" + str(randi_range(1,8)) + ".png"
	$MeteorSprite.texture = load(path)
	
func _process(delta):
	position += Vector2(meteor_direction, 1) * delta * meteor_speed
	rotate(meteor_rotation * delta)

func _on_body_entered(_body):
	print('u ded boi')

