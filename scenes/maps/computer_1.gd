extends Area2D

var player_near = false
var activated = false

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(delta):
	if player_near and Input.is_action_just_pressed("interact") and !activated:
		activated = true
		PopupManager.show_message("PC 1 booted… somehow 😭", 2.0)

func _on_body_entered(body):
	if body.name == "player":
		player_near = true

func _on_body_exited(body):
	if body.name == "player":
		player_near = false
