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
		
		if GameManager.access_key_1:
			
			Audiomanager.play_door_sound() 
			ObjectiveManager.update_objective()
			SceneTransition.fade_to_scene(next_scene)
		
		else:
			PopupManager.show_message(
				"Find the Access Key first... This door has trust issues.",
				2.5
			)
