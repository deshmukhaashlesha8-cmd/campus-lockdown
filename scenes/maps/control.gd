extends Control

func _on_start_pressed():
	SceneTransition.fade_to_scene("res://scenes/maps/groundmap.tscn")
	

func _on_quit_pressed():
	get_tree().quit()
