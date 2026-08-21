extends Area2D

@export var message_text: String = "You feel like you shouldn't be here..."
@export var display_time: float = 3.0
@export var trigger_once: bool = true

var has_triggered := false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		if trigger_once and has_triggered:
			return
		has_triggered = true
		PopupManager.show_message("libraryyy seemss supicious!", 32.0)
		await get_tree().create_timer(2.5).timeout
		
		PopupManager.show_message("██████ 100%", 2.0)
		await get_tree().create_timer(1.0).timeout

func _ready() -> void:
	body_entered.connect(_on_body_entered)
