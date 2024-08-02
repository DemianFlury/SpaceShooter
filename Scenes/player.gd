extends CharacterBody2D

var speed := 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("left", "right", "forward", "back")
	velocity = direction * speed
	move_and_slide()
