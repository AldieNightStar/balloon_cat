extends Node

var score = 0

signal score_updated(n)
signal sound_play(name)

func score_set(n):
	score = n
	if n < 0: n = 0
	score_update()

func score_get():
	return score

func score_add(n):
	score_set(score_get() + n)
	score_update()

func score_update():
	emit_signal("score_updated", score)

func play(name):
	emit_signal("sound_play", name)
