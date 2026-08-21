extends Area2D

@export var pc_id = 1

var player_near = false
var activated = false

@onready var monitor = $Sprite2D
var monitor_on = preload("res://scenes/maps/monitor_on.png")

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(delta):
	if player_near and Input.is_action_just_pressed("interact") and !activated:
		activated = true
		monitor.texture = monitor_on

		match pc_id:
			1:
				GameManager.pc1_on = true
				PopupManager.show_message("PC 1 booted… somehow 😭")

			2:
				GameManager.pc2_on = true
				PopupManager.show_message("PC 2 survived the boot sequence 😭")

			3:
				if GameManager.pc1_on and GameManager.pc2_on:
					GameManager.pc3_on = true
					GameManager.access_key_3 = true
					ObjectiveManager.update_objective()
					PopupManager.show_message("Access Key 3 acquired! Return to the Entrance 😎", 3.0)
				else:
					PopupManager.show_message("Boot PC 1 and PC 2 first, genius 😭", 2.5)
func _on_body_entered(body):
	if body.name == "player":
		player_near = true

func _on_body_exited(body):
	if body.name == "player":
		player_near = false
