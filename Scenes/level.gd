extends Node2D

var meteor_scene: PackedScene = load("res://Scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://Scenes/laser.tscn")

func _on_meteor_timer_timeout():
	var meteor = meteor_scene.instantiate()
	$Meteors.add_child(meteor)
	meteor.connect('collision', _on_meteor_collision)

func _on_meteor_collision():
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/game_over.tscn")

func _on_player_shoot_laser(pos):
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
