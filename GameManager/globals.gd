extends Node

var currentScene = null

var playerName = "Dan"

var paused = false

func _ready():
	currentScene = get_tree().get_current_scene()
	Globals.set("MONEY", 0)
	pass

func pause():
	paused = true

func unPause():
	paused = false

func setScene(scene):
	get_tree().change_scene_to(scene)

func getScene():
	return currentScene

func getPlayerName():
	return playerName