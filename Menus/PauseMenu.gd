extends Control


func _ready():
	print("Paused!")
	pass


func _on_Button_pressed():
	globals.unPause()
	get_parent().queue_free()