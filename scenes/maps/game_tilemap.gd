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
