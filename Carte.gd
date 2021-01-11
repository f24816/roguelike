extends Node2D

var just_spawn = true
var propreties = {}

func _ready():
	randomize()
	position = Vector2(rand_range(200,500), rand_range(200,500))
	var card_data = get_tree().get_root().find_node("Master")
	get_parent().connect("cardvalues", self, "_on_Master_cardvalues")

func _on_Master_cardvalues(label_text, cardvalue, cardcolor, id):
	# Channge text value only once.
	if just_spawn == true:
		get_node("Label").text = label_text
		var x = 1
		propreties = {cardcolor: cardvalue}
		print(propreties[cardcolor]) #this is how you get data from the array.
		print("CID: %d" % [id])
		just_spawn = false
		
