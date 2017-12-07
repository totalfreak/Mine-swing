extends Area2D

export var value = 0.1
var duration = 0
var power = 0
onready var startpos = get_pos()

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if duration > 0:
		set_pos(startpos + Vector2(rand_range(-0.5, -1.0) * power, rand_range(-0.5, -1.0) * power))
		duration -= 1
	pass

func shake(amount, dur):
	duration = dur
	power = amount

func getValue():
	return value

func setValue(new_value):
	value = new_value