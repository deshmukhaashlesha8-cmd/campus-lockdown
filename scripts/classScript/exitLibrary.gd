extends Area2D

@export var next_scene: String = "res://scenes/maps/groundmap.tscn"

var player_near = false

func _on_body_entered(body):
	print("body entered: ", body.name)
	if body.name == "player":
		player_near = true

func _on_body_exited(body):
	if body.name == "player":
		player_near = false

func _process(_delta):
	if player_near and Input.is_action_just_pressed("interact"):
		GameM.next_spawn = "ExitSpawn1"
		Audiomanager.play_door_sound()
		SceneTransition.fade_to_scene(next_scene)
