extends Node2D

var hp = 20

func _ready():
	print("your Hp is:",hp) 
	
func _on_Button_pressed():
	if hp > 0:
		hp -= 1
	if(hp <= 0):
		print("u lose")
	else:
		print(hp)
func _process(delta):
	pass
