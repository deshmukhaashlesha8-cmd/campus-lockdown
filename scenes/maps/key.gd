extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	
	if body.name == "player":
		GameManager.has_lab_key = true
		GameManager.access_key_1 = true
	   
		ObjectiveManager.update_objective()
		PopupManager.show_message("Lab key collected!", 2.0)
		print("Lab key collected!")
		queue_free()
