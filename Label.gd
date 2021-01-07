extends Label
signal data
var i = 0

func _ready():
	self.text = ("Negativ")
	var card_data = get_tree().get_root().find_node("Node2D")
	get_parent().get_parent().connect("cardvalue", self, "_on_Node2D_cardvalue")
func _on_Node2D_cardvalue(value):
	# Channge text value only once.
	if i == 0:
		self.text = value
		i = 1
