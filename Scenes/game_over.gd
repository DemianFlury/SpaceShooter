extends Control

var level_scene = load("res://Scenes/level.tscn")
var timer_done := false

func _ready():
	$ResartTimer.start()

func _process(_delta):
	if Input.is_key_pressed(KEY_SPACE) and timer_done:
		timer_done = false
		get_tree().change_scene_to_packed(level_scene)

func _on_resart_timer_timeout():
	timer_done = true
