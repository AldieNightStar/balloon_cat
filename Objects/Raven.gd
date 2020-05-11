extends Node2D

export var max_pos = 100
var side = 0.5
var hp = 1
var speed = 1

func _ready():
	fly()

func _process(delta):
	if hp >= 1:
		position.x -= speed
	if hp >= 1:
		position.y += 5 * side
		if (position.y > max_pos || position.y < 0):
			side *= -1
	elif hp <= 0:
		position.y += 2
		rotation += 1

func fly():
	$Raven_kinema/AnimatedSprite.play("fly")



func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	hp -= 1
	
#1 -- Анімація (польоту)
#2 -- Переміщення (в ліво)
#3 -- Переміщення (верх вниз)
#4 -- Має життя
#5 -- Смерть
#6 -- Анімація (смерті)
