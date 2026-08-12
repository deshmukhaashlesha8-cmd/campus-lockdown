extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	if GameM.next_spawn != "":
		var spawn = get_node_or_null(GameM.next_spawn)
		if spawn:
			$player.global_position = spawn.global_position
		GameM.next_spawn = ""

func _process(delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	print("Settings opened")


func _on_button_2_pressed() -> void:
	print("Map opened")
