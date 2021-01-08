extends Label
signal data
var just_spawn = true
var propreties = {}

func _ready():
	self.text = ("Negativ")
	var card_data = get_tree().get_root().find_node("Node2D")
	get_parent().get_parent().connect("cardvalues", self, "_on_Node2D_cardvalues")
	
func _on_Node2D_cardvalues(value, cardvalue, cardcolor):
	# Channge text value only once.
	if just_spawn == true:
		self.text = value
		var x = 1
		propreties = {cardcolor: cardvalue, "none" : false}
		print(propreties[cardcolor]) #this is how you get data from the array.
		just_spawn = false
