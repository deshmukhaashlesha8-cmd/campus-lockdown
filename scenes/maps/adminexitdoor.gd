extends Area2D

@export var next_scene: String

var player_near = false

func _process(delta):
	if player_near and Input.is_action_just_pressed("interact"):
		if GameManager.has_lab_key:
			SceneTransition.fade_to_scene(next_scene)
		else:
			print("Lab is locked. Find the key first.")

func _on_body_entered(body):
	if body.name == "Player":
		player_near = true

func _on_body_exited(body):
	if body.name == "Player":
		player_near = false
		
