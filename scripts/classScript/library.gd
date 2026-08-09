extends Area2D

@export var next_scene: String = "res://scenes/maps/library.tscn"

var player_near = false

func _on_body_entered(body):
	if body.name == "player":
		player_near = true

func _on_body_exited(body):
	if body.name == "player":
		player_near = false

func _process(delta):
	if player_near and Input.is_action_just_pressed("interact"):
		
		if GameManager.has_lab_key:
			ObjectiveManager.update_objective()
			SceneTransition.fade_to_scene(next_scene)
		else:
			PopupManager.show_message("Find the key first..Even this door has trust issue!!", 2.5)
		
		
