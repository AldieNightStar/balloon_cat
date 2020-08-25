extends Node

# Additional Classes
var saving = SavingGame.new()
var gameData = GameData.new()

var levelName = "Level01"
var game_just_started = true

signal sound_play(name)
signal _on_joystick_change(vector2)

const SAVE_FILE_NAME = "game"

func play(name):
	emit_signal("sound_play", name)

func spawn(name, node, global_pos):
	var n = load("res://Objects/" + name + ".tscn").instance()
	n.global_position = global_pos
	node.add_child(n)
	n.global_position = global_pos
	return n
