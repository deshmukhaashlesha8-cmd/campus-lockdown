# QuestState.gd
extends Node

signal flag_changed(flag_name: String, value)

var flags := {
	"has_golden_key": false,
	"golden_key_used": false,
	"real_objective_unlocked": false,
	"has_rusty_key": false,
	"ground_floor_complete": false,
}

func set_flag(flag_name: String, value = true) -> void:
	if not flags.has(flag_name):
		push_warning("QuestState: setting unknown flag '%s'" % flag_name)
	flags[flag_name] = value
	flag_changed.emit(flag_name, value)
	print("Flag set: ", flag_name, " = ", value)  # remove later, useful for debugging now

func get_flag(flag_name: String) -> bool:
	return flags.get(flag_name, false)

func reset_all() -> void:
	for key in flags.keys():
		flags[key] = false
