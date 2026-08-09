extends Control

@onready var label = $Panel/Label

func _ready():
	visible = false

func show_message(text: String, duration: float = 2.5):
	label.text = text
	visible = true
	await get_tree().create_timer(duration).timeout
	visible = false
