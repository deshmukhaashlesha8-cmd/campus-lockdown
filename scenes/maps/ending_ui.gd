extends CanvasLayer

func show_ending():
	visible = true

	$background.modulate.a = 0
	$popup.scale = Vector2(0.5, 0.5)
	$popup.modulate.a = 0

	var title = $popup/VBoxContainer/title
	title.scale = Vector2(0.6, 0.6)

	var title_tween = create_tween()
	title_tween.tween_property(title, "scale", Vector2(1.15, 1.15), 0.2)
	title_tween.tween_property(title, "scale", Vector2(1, 1), 0.15)

	var t = create_tween()
	t.tween_property($background, "modulate:a", 0.7, 0.3)
	t.parallel().tween_property($popup, "scale", Vector2(1.05, 1.05), 0.25)
	t.tween_property($popup, "scale", Vector2(1, 1), 0.15)
	t.parallel().tween_property($popup, "modulate:a", 1.0, 0.3)

	$confetti.emitting = true

func _on_button_pressed() -> void:
	SceneTransition.fade_to_scene("res://scenes/maps/main_menu.tscn")

func _on_button_2_pressed() -> void:
	get_tree().quit()
