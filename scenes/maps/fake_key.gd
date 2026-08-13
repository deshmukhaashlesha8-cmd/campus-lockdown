extends Area2D

var triggered := false

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	
	if body.name == "player":
		GameManager.has_lab_key = true
		GameManager.access_key_1 = true
		
		ObjectiveManager.update_objective()
		
		
		PopupManager.show_message("Loading access...", 32.0)
		await get_tree().create_timer(2.0).timeout
		
		PopupManager.show_message("██████ 100%", 2.0)
		await get_tree().create_timer(1.0).timeout
		
		PopupManager.show_message("This key is literally useless 💀", 2.0)
		await get_tree().create_timer(2.5).timeout
		
		PopupManager.show_message("Relax 😂 It actually works.check for switch now", 2.0)
		
		
		queue_free()
 
 
	 
		
