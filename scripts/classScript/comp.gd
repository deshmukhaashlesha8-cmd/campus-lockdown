extends Area2D

@export var next_scene: String = "res://scenes/maps/complab_1.tscn"
@onready var popup = get_node("../popupbox")

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
			Audiomanager.play_door_sound()
			ObjectiveManager.update_objective()
			SceneTransition.fade_to_scene(next_scene)
		else:
			PopupManager.show_message("Congratulations! You found a locked door. 🏆.", 2.5)
	

func _on_msg_zone_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
