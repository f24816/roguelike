extends Node2D

var hp = 20

func _ready():
	pass
func _on_Enemy_deal_damage():
	hp -= 1


func _on_Button_pressed():
	hp -= 1

func _process(delta):
	print(hp)
