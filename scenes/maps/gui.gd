extends CanvasLayer

@onready var task_panel = get_node_or_null("Button2/task_panel")

func _ready() -> void:
	if task_panel:
		task_panel.visible = false

func _on_button_2_pressed() -> void:
	if task_panel:
		task_panel.visible = !task_panel.visible













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


func _on_texture_button_pressed() -> void:
	$SettingsPanel.visible = !$SettingsPanel.visible


func _on_cancel_pressed() -> void:
	$SettingsPanel.visible = false
	
	var sound_on := true
