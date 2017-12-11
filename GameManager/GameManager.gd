extends Node2D

var money = 0.0

var moneyText
var pauseMenu = load("res://Scenes/PauseMenu.tscn")

func _ready():
	print(get_tree().get_root().get_child(1).get_name())
	moneyText = get_tree().get_root().get_child(1).get_node("UI").get_node("MoneyText")
	updateMoney()

func add(amount):
	money += amount
	updateMoney()

func remove(amount):
	money-=amount
	updateMoney()

func getMoney():
	return money

func updateMoney():
	var text = str(getMoney())
	moneyText.set_text("$: " + text)

func _on_Button_pressed():
	var pMenu = pauseMenu.instance()
	get_tree().get_root().get_child(1).add_child(pMenu)
	globals.pause()
