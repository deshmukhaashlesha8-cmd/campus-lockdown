# Interactable.gd
class_name Interactable
extends Area2D

	
@export var prompt_text := "Press E"
signal interacted

var _player_in_range := false

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		_player_in_range = true
		# TODO: show interact prompt UI here later if you want ("Press E" bubble)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		_player_in_range = false

func _unhandled_input(event: InputEvent) -> void:
	if _player_in_range and event.is_action_pressed("interact"):
		print("interact pressed")
		interact()

func interact() -> void:
	interacted.emit()
	_on_interact()
	
func _on_interact() -> void:
	PopupManager.show_popup("Test popup works!")	
