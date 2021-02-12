extends Node

class_name Advertisings

static func get_ads():
	var name = OS.get_name()
	if name == "Windows":
		return AdEmulator
	
	

class AdEmulator:
	pass
