# PopupManager.gd
extends CanvasLayer

var popup_label: Label
var tween: Tween

func _ready() -> void:
	

	popup_label = Label.new()
	popup_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER

	var font = load("res://font/OpenSans_SemiCondensed-Bold.ttf")
	popup_label.add_theme_font_override("font", font)
	popup_label.add_theme_font_size_override("font_size", 25)

	popup_label.add_theme_color_override("font_color", Color("#FFF4D6"))
	popup_label.add_theme_color_override("font_shadow_color", Color(0, 0, 0, 0.8))
	popup_label.add_theme_constant_override("shadow_offset_x", 2)
	popup_label.add_theme_constant_override("shadow_offset_y", 2)

	popup_label.modulate.a = 0.0
	popup_label.set_anchors_preset(Control.PRESET_CENTER_TOP)
	popup_label.position = Vector2(-300, 40)
	popup_label.size = Vector2(600, 60)

	add_child(popup_label)

func show_message(text: String, duration: float = 2.5) -> void:
	popup_label.text = text

	if tween:
		tween.kill()

	tween = create_tween()
	tween.tween_property(popup_label, "modulate:a", 1.0, 0.2)
	tween.tween_interval(duration)
	tween.tween_property(popup_label, "modulate:a", 0.0, 0.3)
