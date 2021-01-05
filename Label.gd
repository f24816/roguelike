extends Label

func _ready():
	self.text = ("Negativ")
	var card_data = get_tree().get_root().find_node("Node2D")
	get_parent().get_parent().connect("cardvalue", self, "_on_Node2D_cardvalue")
func _on_Node2D_cardvalue(value):
	self.text = value
