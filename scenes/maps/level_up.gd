extends Area2D

var player_near = false

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(delta):
	if player_near and Input.is_action_just_pressed("interact"):
		if GameManager.all_tasks_done():
			ObjectiveManager.update_objective()

			var ending = get_tree().current_scene.get_node("ending ui")
			ending.show_ending()

		else:
			PopupManager.show_message("Complete all department tasks first!")

		player_near = false
		await get_tree().create_timer(0.5).timeout
		player_near = true

func _on_body_entered(body):
	if body.name == "player":
		player_near = true

func _on_body_exited(body):
	if body.name == "player":
		player_near = false
