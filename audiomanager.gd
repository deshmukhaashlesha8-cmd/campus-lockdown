extends Node

var music = preload("res://audio/Background (2).mp3")
var door_sound = preload("res://audio/door.mp3")

var music_player


func _ready():
	music_player = AudioStreamPlayer.new()
	add_child(music_player)

	music_player.stream = music
	music_player.volume_db = -15
	music_player.play()


func play_door_sound():
	var player = AudioStreamPlayer.new()
	add_child(player)
	player.stream = door_sound
	player.volume_db = -15
	player.play()

	player.finished.connect(player.queue_free)
