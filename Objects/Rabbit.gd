extends KinematicBody2D

func _ready():
	$anim.play("Idle")

func fire():
	var egg = load("res://Objects/Egg.tscn").instance()
	egg.global_position = global_position - Vector2(0, 50)
	get_parent().add_child(egg)

func _on_VisibilityNotifier2D_screen_entered():
	$anim.play("Fire")

