extends Node

class_name Dialogs

func dialog_yes_no(label, parent_node, vec2Pos):
	var d = G.spawn("Dialog", parent_node, vec2Pos)
	d.label = label
	return d
