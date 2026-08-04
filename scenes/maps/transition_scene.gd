extends CanvasLayer

@onready var fade_rect = $ColorRect

func fade_to_scene(scene_path: String):
	var tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 1.0, 0.3)
	await tween.finished

	get_tree().change_scene_to_file(scene_path)

	tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 0.0, 0.3)
	await tween.finished
