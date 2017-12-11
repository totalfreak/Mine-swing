extends Area2D

export var rockNumber = 1
var duration = 0
var power = 0
onready var startpos = get_pos()
var pixelSpawner = preload("res://Scenes/pixelSpawner.tscn")
var stoneSpr = preload("res://Mineables/Stone/stoneSpr.png")
var stonePixel = preload("res://Mineables/Stone/stonepixel.png")

var pixel
var sprite
var value

func _ready():
	setRock(rockNumber)
	set_fixed_process(true)

func _fixed_process(delta):
	if duration > 0:
		set_pos(startpos + Vector2(rand_range(-0.5, -1.0) * power, rand_range(-0.5, -1.0) * power))
		duration -= 1
	pass

func shake(amount, dur):
	duration = dur
	power = amount


func setValue(new_value):
	value = new_value

func getValue():
	return value

func setRock(whatRock):
	#Rock
	if whatRock == 1:
		setSpr(stoneSpr)
		setPixel(stonePixel)
		setValue(0.1)

func setSpr(desiredSpr):
	get_node("Sprite").set_texture(desiredSpr)

func setPixel(desiredPixel):
	pixel = desiredPixel

func getPixel():
	return pixel

func doSpawnParticles():
	#Spawner particles
	var spawner = pixelSpawner.instance()
	self.add_child(spawner)
	spawner.set_global_pos(self.get_global_pos())
	spawner.set_texture(getPixel())
	spawner.set_amount((randi() % 60)+20)
	spawner.set_lifetime(10)
	var deleteTimer = Timer.new()
	deleteTimer.set_wait_time( 0.1 )
	deleteTimer.connect("timeout",self,"deleteSpawner", [ spawner ])
	add_child(deleteTimer)
	deleteTimer.start()

func deleteSpawner( spawner ):
	spawner.set_emitting(false)