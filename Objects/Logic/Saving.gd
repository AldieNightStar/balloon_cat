extends Node

class_name SavingGame

signal error(reason)

func save_obj(obj, name):
	name = "user://" + name + ".sav"
	var file = File.new()
	if file.open(name, File.WRITE) != 0:
		emit_signal("error", "File cannot be saved!")
		return
	file.store_line(to_json(obj))
	file.close()
	
func load_obj(name):
	var file = File.new()
	if file.open("user://" + name + ".sav", file.READ) != 0:
		emit_signal("error", "File cannot be loaded!")
		return
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close()
	return data

func exists_obj(name):
	return File.new().file_exists("user://" + name + ".sav")
