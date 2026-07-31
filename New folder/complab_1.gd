extends CharacterBody2D

const SPEED = 150.0

func _physics_process(_delta):

	var direction = Vector2.ZERO

	direction.x = Input.get_action_strength("walk_right") - Input.get_action_strength("walk_left")
	direction.y = Input.get_action_strength("walk_down") - Input.get_action_strength("walk_up")

	if direction != Vector2.ZERO:
		direction = direction.normalized()

	velocity = direction * SPEED

	move_and_slide()
