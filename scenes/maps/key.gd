extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "player":
		GameManager.access_key_1 = true
		
		ObjectiveManager.update_objective()
		
		PopupManager.show_message("Access Key 1 collected!", 2.0)
		print("Access Key 1 collected!")
		
		queue_free()
