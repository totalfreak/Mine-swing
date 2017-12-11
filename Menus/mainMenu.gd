extends Control

var mainlevel = load("res://Scenes/World.tscn")

func _ready():

	pass


func _on_PlayButton_pressed():
	globals.setScene(mainlevel)
	pass # replace with function body


func _on_QuitButton_pressed():
	get_tree().quit()
	pass # replace with function body
