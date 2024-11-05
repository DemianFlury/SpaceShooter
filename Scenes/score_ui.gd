extends CanvasLayer

func _ready():
	$MarginContainer/ScoreLabel.text = str(int($WinTimer.time_left))	

func _on_win_timer_timeout():
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/game_win.tscn")

func _on_update_score_timer_timeout():
	$MarginContainer/ScoreLabel.text = str(ceil($WinTimer.time_left))
	$UpdateScoreTimer.wait_time = 1
