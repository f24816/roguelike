extends Node2D

var hp = 500
var player_name = "Isaac"
var power = 1
var coins = 0
var price = 1

func _ready():
	$Label.text = ("You %s have %d HP to start with." % [player_name, hp])

func _on_Button_pressed():
	if hp > 0:
		hp -= power
		coins += 1
	if(hp <= 0):
		$Label.text = ("You Died")
	else:
		$Label.text = ("%d HP left." % [hp])
		
func _on_addpower_pressed():
	if coins >= price:
		power += 1
		coins -= price
		price += (power+5)*2

func _process(delta):
#	$Coins.text = str(coins)
#	$Price.text = str(price)
	$Price.text = ("Price %d" % [price])
	$Coins.text = ("Coins %d" % [coins])
