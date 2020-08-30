extends Node

class_name GameData

signal game_loaded()

var inventory : Inventory = Inventory.new()
var _obj = {}

func save_game():
	set_value("_inv", inventory._obj)
	G.saving.save_obj(G.SAVE_FILE_NAME, _obj)

func load_game():
	if (G.saving.exists_obj(G.SAVE_FILE_NAME)):
		_obj = G.saving.load_obj(G.SAVE_FILE_NAME)
	inventory._obj = get_value("_inv", {})
	emit_signal("game_loaded")

func get_value(key, defaultValue=null):
	if _obj.has(key):
		return _obj[key]
	else:
		return defaultValue

func set_value(key, value):
	_obj[key] = value

# ===================================
# Game coins
# ===================================
func set_coins(n):
	if n < 0: n = 0
	set_value("coins", n)

func get_coins():
	return get_value("coins", 0)

# ====================================
# Player Maximum HP
# ====================================
func get_max_hp():
	return get_value("maxhp", 4)

func set_max_hp(n):
	set_value("maxhp", n)

# =====================================
# Game volumes (Minimum: 0, Maximum: 1)
# =====================================
signal music_volume_changed(n)
signal sound_volume_changed(n)

func set_music_volume(n):
	set_value("mvolume", n)
	emit_signal("music_volume_changed", n)

func set_sound_volume(n):
	set_value("svolume", n)
	emit_signal("sound_volume_changed", n)

func get_music_volume():
	return get_value("mvolume", .9)

func get_sound_volume():
	return get_value("svolume", .9)
	
# ======================================
# Joystick settings
# ======================================
func set_joystick_is_big(_bool):
	set_value("jbig", _bool)

func get_joystick_is_big():
	return get_value("jbig", false)
