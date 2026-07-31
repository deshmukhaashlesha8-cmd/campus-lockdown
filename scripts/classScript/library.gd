extends Area2D

@export var next_scene: String = "res://scenes/maps/library.tscn"

var player_near = false

func _ready():
	print("script start")
	
func _on_body_entered(body):
	print("Body entered:", body.name)
	player_near = true	
	
func _on_body_exited(body):
	print("Body exited:", body.name)
	player_near = false
	
func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		print("E pressed")
		
	if player_near and Input.is_action_just_pressed("interact"):	
			print("Changing scene...")	
			get_tree().change_scene_to_file(next_scene)
