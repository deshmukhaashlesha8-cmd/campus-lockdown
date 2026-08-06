# PopupBox.gd — attach to PopupBox.tscn root (CanvasLayer)
extends CanvasLayer

signal closed

@onready var message_label: Label = $Panel/MessageLabel

func _ready() -> void:
	visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS  # so popups work even if you pause gameplay

func show_message(text: String) -> void:
	
	visible = true
	get_tree().paused = true  # optional: freeze gameplay while popup is up

func _unhandled_input(event: InputEvent) -> void:
	if not visible:
		return
	if event.is_action_pressed("interact") or event.is_action_pressed("ui_accept"):
		_close()
		get_viewport().set_input_as_handled()

func _close() -> void:
	visible = false
	get_tree().paused = false
	closed.emit()
