extends Node2D

var cards = [2, 3, 4, 5, 6, 7, 8, 9, 10,"A","J","Q","K"]
var colors = ["trefla","inima","inima neagra","romb"]
var value = "Hello, I am genius, it works!"
var i = 0
# First we signal the cardvalue.
signal cardvalue(value)
# Preload the instance.
const Carte = preload("res://Carte.tscn")
# Set a variable with the position of the Label node.
onready var Card = get_node("root/Node2D/Card/Label")

func _ready():	
	i = 0
	
	while i < 4:
		i += 1
		randomize()
		
		var card = round(rand_range(0,12))
		var color = round(rand_range(0,3))
		var cardcolor = colors[color]
		var cardsymbol = cards[card]
		var cardvalue = card + 2
		
		# Create an instance as child.
		var GrabedInstance= Carte.instance()
		self.add_child(GrabedInstance)
		
		print(cardsymbol)
		print(cardcolor)
		print("Card value is", cardvalue)
		value = ("%s de %s" % [cardsymbol, cardcolor])
		# Need to change name and send signal to only 1 card.
		# Set node location to be personal.
		# Send value just to that one.
		# After ading instance you can conect or emit signal with value.
		emit_signal("cardvalue", value)
