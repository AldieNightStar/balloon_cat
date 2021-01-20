extends Node

# Additional Classes
var saving   : SavingGame = SavingGame.new()
var gameData : GameData   = GameData.new()
var dialogs  : Dialogs    = Dialogs.new()

var levelName : String = "Level01"
var game_just_started : bool = true
var buttons_locked : bool = false

signal sound_play(name)
signal screen_cat_update(posVector2)
signal kill_enemy(enemy_name)

const SAVE_FILE_NAME = "game"

func play(name):
	emit_signal("sound_play", name)

func spawn(name, node, global_pos):
	var n = load("res://Objects/" + name + ".tscn").instance()
	n.global_position = global_pos
	node.add_child(n)
	n.global_position = global_pos
	return n
