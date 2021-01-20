extends Node

signal inventory_update(inv)

class_name Inventory

var _obj = {}

func set_item(key, n: int):
	_obj[key] = n
	emit_signal("inventory_update", self)
	
func get_item(key):
	if _obj.has(key):
		return _obj[key]
	return 0

func add_item(key, n: int):
	if n < 1: return false
	set_item(key, get_item(key) + n)
	return true

func sub_item(key, n: int):
	if n < 1: return false
	var i = get_item(key)
	if i >= n:
		set_item(key, i - n)
		return true
	return false
