class_name idleState
extends Node

@export var player: CharacterBody2D
@export var animated_sprite_2D: AnimatedSprite2D


var direction: Vector2 = Vector2.ZERO

 


	# Reverse controls
func _process(_delta: float):
	direction = Vector2.ZERO

	# 1. Check the on-screen control first
	if player.mobile_direction != Vector2.ZERO:
		direction = player.mobile_direction

	# 2. Otherwise use keyboard controls
	else:
		if player.reversed_controls:
			if Input.is_action_pressed("walk_left"):
				direction = Vector2.RIGHT
			elif Input.is_action_pressed("walk_right"):
				direction = Vector2.LEFT
			elif Input.is_action_pressed("walk_up"):
				direction = Vector2.DOWN
			elif Input.is_action_pressed("walk_down"):
				direction = Vector2.UP
		else:
			if Input.is_action_pressed("walk_left"):
				direction = Vector2.LEFT
			elif Input.is_action_pressed("walk_right"):
				direction = Vector2.RIGHT
			elif Input.is_action_pressed("walk_up"):
				direction = Vector2.UP
			elif Input.is_action_pressed("walk_down"):
				direction = Vector2.DOWN

	# Animations
	if direction == Vector2.UP:
		animated_sprite_2D.play("walk_back")
	elif direction == Vector2.RIGHT:
		animated_sprite_2D.play("walk_right")
	elif direction == Vector2.DOWN:
		animated_sprite_2D.play("walk_front")
	elif direction == Vector2.LEFT:
		animated_sprite_2D.play("walk_left")
	else:
		animated_sprite_2D.stop()

func on_enter():
	pass

func on_exit():
	pass
