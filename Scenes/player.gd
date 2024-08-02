extends CharacterBody2D

var speed := 500
signal shoot_laser(pos)
var gun_ready := true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left", "right", "forward", "back")
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_just_pressed("shoot") and gun_ready:
		shoot_laser.emit($LaserGun.global_position)
		gun_ready = false
		$LaserGunTimer.start()


func _on_laser_gun_timer_timeout():
	gun_ready = true
