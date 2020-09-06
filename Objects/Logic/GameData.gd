extends Node

class_name GameData

signal game_loaded()

var inventory : Inventory = Inventory.new()
var records : RecordsData = RecordsData.new()
var _obj = {}

func save_game():
	set_value("_inv", inventory._obj)
	set_value("_recs", records._obj)
	G.saving.save_obj(G.SAVE_FILE_NAME, _obj)

func load_game():
	if (G.saving.exists_obj(G.SAVE_FILE_NAME)):
		_obj = G.saving.load_obj(G.SAVE_FILE_NAME)
	inventory._obj = get_value("_inv", {})
	records._obj = get_value("_recs", {})
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
signal coins_update(n)

func set_coins(n):
	if n < 0: n = 0
	set_value("coins", n)
	emit_signal("coins_update", n)

func get_coins():
	return get_value("coins", 0)

func sub_coins(n: int):
	var c = get_coins()
	if n <= c:
		set_coins(c - n)
		return true
	return false

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

func set_music_volume(n: float):
	set_value("mvolume", n)
	emit_signal("music_volume_changed", n)

func set_sound_volume(n: float):
	set_value("svolume", n)
	emit_signal("sound_volume_changed", n)

func get_music_volume() -> float:
	return get_value("mvolume", .9)

func get_sound_volume() -> float:
	return get_value("svolume", .9)
	
# =====================================
# Gems
# =====================================
signal gems_update(n)

func get_gems() -> int:
	return get_value("gems", 0)

func set_gems(n: int):
	set_value("gems", n)
	emit_signal("gems_update", n)

func sub_gems(n: int):
	var d = get_gems()
	if n <= d:
		set_gems(d - n)
		return true
	return false


# ============================================
# Kills
# ============================================

func set_kills(name, n):
	records.set_best_of(name, n)
	set_value("kills_" + name, n)

func get_kills(name, def):
	return get_value("kills_" + name, def)


