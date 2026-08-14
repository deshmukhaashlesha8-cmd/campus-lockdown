extends Control

var player
var moving := false

func _ready():
	player = get_tree().get_first_node_in_group("player")

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				moving = true
				update_direction(event.position)
			else:
				moving = false
				stop_player()

	if event is InputEventMouseMotion and moving:
		update_direction(event.position)

func update_direction(pos: Vector2):
	if player == null:
		return

	var center = size / 2.0
	var offset = pos - center

	# Dead zone in the center
	if offset.length() < 25:
		stop_player()
		return

	if abs(offset.x) > abs(offset.y):
		if offset.x > 0:
			player.mobile_direction = Vector2.RIGHT
		else:
			player.mobile_direction = Vector2.LEFT
	else:
		if offset.y > 0:
			player.mobile_direction = Vector2.DOWN
		else:
			player.mobile_direction = Vector2.UP

func stop_player():
	if player:
		player.mobile_direction = Vector2.ZERO
