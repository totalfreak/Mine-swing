extends Node2D

var money = 0.0

var moneyText

func _ready():
	moneyText = get_tree().get_root().get_child(0).get_node("Control").get_node("MoneyText")

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
	var mod = fmod(money, round(money))
	print(mod)
	if mod == 0:
		print("Round number")
		text += ".0"
	moneyText.set_text("$: " + text)