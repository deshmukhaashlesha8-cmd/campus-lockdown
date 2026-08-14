extends CanvasLayer

@onready var task_panel = get_node_or_null("Button2/task_panel")
@onready var setting_panel = %settings



	


func _on_button_2_pressed() -> void:
	if task_panel:
		task_panel.visible = !task_panel.visible


# -------------------- Mobile Controls --------------------

func _on_up_button_down() -> void:
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.mobile_direction = Vector2.UP

func _on_up_button_up() -> void:
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.mobile_direction = Vector2.ZERO

func _on_down_button_down() -> void:
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.mobile_direction = Vector2.DOWN

func _on_down_button_up() -> void:
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.mobile_direction = Vector2.ZERO

func _on_right_button_down() -> void:
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.mobile_direction = Vector2.RIGHT

func _on_right_button_up() -> void:
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.mobile_direction = Vector2.ZERO

func _on_left_button_down() -> void:
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.mobile_direction = Vector2.LEFT

func _on_left_button_up() -> void:
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.mobile_direction = Vector2.ZERO


# -------------------- Settings Panel --------------------

func _on_texture_button_pressed() -> void:
	setting_panel.visible = true
	var tween = create_tween()
	tween.tween_property(setting_panel, "modulate:a", 1.0, 0.25)


func _on_cancel_pressed() -> void:
	
	setting_panel.visible = false
	var tween = create_tween()
	tween.tween_property(setting_panel, "modulate:a", 0.0, 0.25)
	await tween.finished
	


# -------------------- Buttons --------------------

func _on_play_pressed() -> void:
	SceneTransition.fade_to_scene("res://scenes/maps/main_menu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
