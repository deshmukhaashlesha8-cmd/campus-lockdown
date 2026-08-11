extends CanvasLayer

@onready var color_rect = $ColorRect

func fade_out():
	var tween = create_tween()
	tween.tween_property(color_rect, "modulate:a", 1.0, 0.5)

func fade_in():
	var tween = create_tween()
	tween.tween_property(color_rect, "modulate:a", 0.0, 0.5)
