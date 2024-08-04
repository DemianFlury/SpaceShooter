extends CharacterBody2D

var speed := 500
signal shoot_laser(pos)
var gun_ready := true
var shot_fired := false

# Called when the node enters the scene tree for the first time.
func _ready():
	$LaserGunAnimation.visible = false
	$LaserGunAnimation.frame = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# movement
	var direction = Input.get_vector("left", "right", "forward", "back")
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_just_pressed("shoot") and gun_ready:
		# laser gun was fired, start animation
		shot_fired = true
		$LaserGunAnimation.visible = true
		$LaserGunAnimation.play()


func _on_laser_gun_timer_timeout():
	gun_ready = true


func _on_laser_gun_animation_animation_finished():
	# firing aniomation is done, spawn the laser
	$LaserGunAnimation.visible = false
	shoot_laser.emit($LaserGun.global_position)
	gun_ready = false
	shot_fired = false
	$LaserGunTimer.start()
