extends Node

class_name GameData

var _obj = {}

func save_game():
	G.saving.save_obj(G.SAVE_FILE_NAME, _obj)

func load_game():
	if (G.saving.exists_obj(G.SAVE_FILE_NAME)):
		_obj = G.saving.load_obj(G.SAVE_FILE_NAME)

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
