class_name idleState
extends Node

@export var player: CharacterBody2D
@export var animated_sprite_2D: AnimatedSprite2D

var direction: Vector2 = Vector2.ZERO

const SPEED = 90.0

func _physics_process(_delta):
	player.velocity = direction * SPEED
	player.move_and_slide()


func _process(_delta: float):
	direction = Vector2.ZERO

	if Input.is_action_pressed("walk_left"):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("walk_right"):
		direction = Vector2.RIGHT
	elif Input.is_action_pressed("walk_up"):
		direction = Vector2.UP
	elif Input.is_action_pressed("walk_down"):
		direction = Vector2.DOWN

	if direction == Vector2.UP:
		animated_sprite_2D.play("walk_back")
	elif direction == Vector2.RIGHT:
		animated_sprite_2D.play("walk_right")               
	elif direction == Vector2.DOWN:
		animated_sprite_2D.play("walk_front")
	elif direction == Vector2.LEFT:
		animated_sprite_2D.play("walk_left")
	else:
		match direction:
			"right":
				animated_sprite_2D.play("idle_right")
			"left":
				animated_sprite_2D.play("idle_left")
			"up":
				animated_sprite_2D.play("idle_up")
			"down":
				animated_sprite_2D.play("idle_down")




func on_enter():
	pass

func on_exit():
	pass
