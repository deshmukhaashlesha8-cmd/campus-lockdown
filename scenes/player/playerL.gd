
extends CharacterBody2D


var reversed_controls = false
const SPEED = 150.0

func _physics_process(_delta):
	var direction = Vector2.ZERO

	if reversed_controls:
		# Reverse the controls
		direction.x = Input.get_action_strength("walk_left") - Input.get_action_strength("walk_right")
		direction.y = Input.get_action_strength("walk_up") - Input.get_action_strength("walk_down")
	else:
		# Normal controls
		direction.x = Input.get_action_strength("walk_right") - Input.get_action_strength("walk_left")
		direction.y = Input.get_action_strength("walk_down") - Input.get_action_strength("walk_up")

	if direction != Vector2.ZERO:
		direction = direction.normalized()

	velocity = direction * SPEED
	move_and_slide()

func activate_reverse_controls():
	reversed_controls = true
	await get_tree().create_timer(10.0).timeout
	reversed_controls = false
