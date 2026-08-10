extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.has_method("activate_reverse_controls"):
		GameManager.access_key_2 = true
		
		body.activate_reverse_controls()
		PopupManager.show_message("Access Key 2 acquired!", 2.0)
		queue_free()
