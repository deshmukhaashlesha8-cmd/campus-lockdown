extends ColorRect

@onready var label = $Label

func _ready():
	# Start completely invisible
	modulate.a = 0.0
	label.modulate.a = 0.0

	# Fade IN
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "modulate:a", 1.5, 1.5)
	tween.tween_property(label, "modulate:a", 1.5, 1.5)

	await tween.finished

	# Stay visible for 3 seconds
	await get_tree().create_timer(4.0).timeout

	# Fade OUT
	var fade_out = create_tween()
	fade_out.set_parallel(true)
	fade_out.tween_property(self, "modulate:a", 0.0, 1.0)
	fade_out.tween_property(label, "modulate:a", 0.0, 1.0)

	await fade_out.finished

	visible = false
