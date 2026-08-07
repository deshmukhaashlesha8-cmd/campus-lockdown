extends CanvasLayer

@onready var objective_label = $ObjectiveLabel

func _ready():
	ObjectiveManager.set_label(objective_label)
