extends Node2D

var cards = [2, 3, 4, 5, 6, 7, 8, 9, 10,"A","J","Q","K"]
var colors = ["trefla","inima","inima neagra","romb"]
var value = "Hello, I am genius, it works!"
var i = 0
# First we signal the cardvalue.

signal cardvalues(value, cardvalue, cardcolor)
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
		
		value = ("%s de %s" % [cardsymbol, cardcolor])
		#################
		# May want to create unique id for cards
		# When you execute function delta, emit signal to cards. 
		# If criteria met, card gives Master the id of the card.
		# Master takes id and data inside the change signal to cards.
		# On change signal, card recieves and uses data.
		# We can optimise code by having one big signal and changing card data base on 
		# what data has been recieved, having less if statements with each created card.
		#################
		
		# After ading instance you can conect or emit signal with values, they have to be in order at the recepient.
		emit_signal("cardvalues", value ,cardvalue, cardcolor)
