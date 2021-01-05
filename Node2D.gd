extends Node2D

var hp = 20
var player_name = "Isaac"

func _ready():
	$Label.text = ("You %s have %d HP to start with." % [player_name, hp])
func _on_Button_pressed():
	if hp > 0:
		hp -= 1
	if(hp <= 0):
		$Label.text = ("You Died")
	else:
		$Label.text = ("%d HP left." % [hp])
func _process(delta):
	pass
