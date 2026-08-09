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
		PopupManager.show_message(message_text, display_time)

func _ready() -> void:
	body_entered.connect(_on_body_entered)
