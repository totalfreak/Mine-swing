extends Node2D

var money = 0.0

var moneyText

func _ready():
	moneyText = get_tree().get_root().get_child(0).get_node("Control").get_node("MoneyText")
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