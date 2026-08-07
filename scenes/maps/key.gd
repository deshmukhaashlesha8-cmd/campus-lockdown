extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	
	if body.name == "player":
		GameManager.has_lab_key = true
		ObjectiveManager.update_objective()
		print("Lab key collected!")
		queue_free()
