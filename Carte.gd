extends Node2D

var just_spawn = true
var propreties = {}

func _ready():
	randomize()
	position = Vector2(rand_range(0,500), rand_range(0,500))
	var card_data = get_tree().get_root().find_node("Node2D")
	get_parent().connect("cardvalues", self, "_on_Node2D_cardvalues")

func _on_Node2D_cardvalues(value, cardvalue, cardcolor):
	# Channge text value only once.
	if just_spawn == true:
		get_node("Label").text = value
		var x = 1
		propreties = {cardcolor: cardvalue, "none" : false}
		print(propreties[cardcolor]) #this is how you get data from the array.
		just_spawn = false
