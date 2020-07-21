extends Sprite

const RADIUS = 120
const SMALL_RADIUS = 45

var stick_pos
var evt_index = -1

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			position = event.position
			stick_pos = position
			$small.position = Vector2()
			$anim.play("show")
			
			
			if stick_pos.distance_to(event.position) < RADIUS:
				evt_index = event.index
				
		elif evt_index != -1:
			if evt_index == event.index:
				$anim.play("hide")
				evt_index = -1
				$"../".stick_speed = 0
				$"../".stick_vector = Vector2()
				$"../".stick_angle = 0
				
	if	evt_index != -1 and event is InputEventScreenDrag:
		
		var dist = stick_pos.distance_to(event.position)
		var vect = (event.position - stick_pos).normalized()
		
		if dist+SMALL_RADIUS > RADIUS:
			dist = RADIUS-SMALL_RADIUS
			
		$"../".stick_speed = dist
		$"../".stick_vector = vect
		$"../".stick_angle = event.position.angle_to_point(stick_pos)
		
		$small.position = vect * dist
