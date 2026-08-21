extends CharacterBody2D

var reversed_controls = false
var mobile_direction: Vector2 = Vector2.ZERO

const SPEED = 270.0

func _physics_process(_delta):

	var direction = Vector2.ZERO

	direction.x = Input.get_action_strength("walk_right") - Input.get_action_strength("walk_left")
	direction.y = Input.get_action_strength("walk_down") - Input.get_action_strength("walk_up")

	# Add movement from the on-screen control buttons
	direction += mobile_direction

	if direction != Vector2.ZERO:
		direction = direction.normalized()

	velocity = direction * SPEED

	move_and_slide()
