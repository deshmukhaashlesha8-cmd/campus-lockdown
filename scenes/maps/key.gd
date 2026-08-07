extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	print("Something touched key:", body.name)
	if body.name == "player":
		GameManager.has_lab_key = true
		print("Lab key collected!")
		queue_free()
