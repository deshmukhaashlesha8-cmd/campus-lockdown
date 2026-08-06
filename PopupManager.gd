# PopupManager.gd
extends Node

const POPUP_SCENE := preload("res://scenes/maps/popupbox.tscn")

var _popup_instance: CanvasLayer = null

func _ensure_popup() -> void:
	if _popup_instance == null:
		_popup_instance = POPUP_SCENE.instantiate()
		get_tree().root.add_child(_popup_instance)

func show_popup(text: String, on_closed: Callable = Callable()) -> void:
	_ensure_popup()
	if _popup_instance.visible:
		push_warning("PopupManager: tried to show popup while one is active")
		return

	if on_closed.is_valid():
		_popup_instance.closed.connect(on_closed, CONNECT_ONE_SHOT)

	_popup_instance.show_message(text)
