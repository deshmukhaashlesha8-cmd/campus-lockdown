extends Area2D

var triggered := false


func _ready():
	body_entered.connect(_on_body_entered)


func _on_body_entered(body):
	if triggered:
		return

	if body.is_in_group("player"):
		triggered = true
		await show_fake_key_troll()
		queue_free()


func show_fake_key_troll():
	# -----------------------------
	# Create fullscreen UI
	# -----------------------------
	var layer = CanvasLayer.new()
	layer.layer = 200
	get_tree().root.add_child(layer)

	var panel = ColorRect.new()
	panel.color = Color(0.02, 0.02, 0.02, 0.95)
	panel.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	panel.mouse_filter = Control.MOUSE_FILTER_STOP
	layer.add_child(panel)


	# -----------------------------
	# Main title
	# -----------------------------
	var title = Label.new()
	title.text = "ACCESS GRANTED"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER

	title.add_theme_font_size_override("font_size", 60)

	title.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
	title.position = Vector2(-350, -100)
	title.size = Vector2(700, 100)

	panel.add_child(title)


	# -----------------------------
	# Loading text
	# -----------------------------
	var loading = Label.new()
	loading.text = "Loading..."
	loading.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	loading.add_theme_font_size_override("font_size", 28)

	loading.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
	loading.position = Vector2(-300, 20)
	loading.size = Vector2(600, 60)

	panel.add_child(loading)


	# -----------------------------
	# FIRST SCREEN
	# -----------------------------
	await get_tree().create_timer(2.0).timeout


	# -----------------------------
	# SECOND SCREEN
	# -----------------------------
	title.text = "NAHH BRO 💀"
	title.add_theme_color_override("font_color", Color.RED)

	loading.text = "THAT'S A FAKE ONE 😭"


	await get_tree().create_timer(2.5).timeout


	# -----------------------------
	# THIRD SCREEN
	# -----------------------------
	title.text = "YOU REALLY THOUGHT THAT WAS REAL? 💀"
	title.remove_theme_color_override("font_color")

	loading.text = "Try again, detective."


	await get_tree().create_timer(2.5).timeout


	# -----------------------------
	# REMOVE UI
	# -----------------------------
	layer.queue_free()
