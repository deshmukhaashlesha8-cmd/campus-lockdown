extends Area2D

@export var next_scene: String = "res://scenes/maps/admin.tscn"

var player_near = false

func _process(delta):
	if player_near and Input.is_action_just_pressed("interact"):
		if GameManager.has_lab_key:
			ObjectiveManager.update_objective()
			SceneTransition.fade_to_scene(next_scene)
		else:
			PopupManager.show_message("Even this door rejected you. Find the key first.", 2.5)

func _on_body_entered(body):
	if body.name == "player":
		player_near = true

func _on_body_exited(body):
	if body.name == "player":
		player_near = false
