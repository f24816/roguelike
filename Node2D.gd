extends Node2D

var id = 0
var cards = [2, 3, 4, 5, 6, 7, 8, 9, 10,"A","J","Q","K"]
var colors = ["trefla","inima","inima neagra","romb"]
var label_text = "Hello World!"
var i = 0

# First we signal the cardvalue.
signal cardvalues(value, cardvalue, cardcolor)

# Preload the instance.
const Carte = preload("res://Carte.tscn")

# Set a variable with the position of the Label node.
onready var Card = get_node("root/Master/Card/Label")

func _ready():	
	i = 0
	
	while i < 4:
		i += 1
		_create_card()
	
	get_node("Debug_Console").connect("input_text", self, "_on_LineEdit_input_text")
		
		#################
		# May want to create unique id for cards. //
		# May want to account for two cards meeting requirements at once.
		# When you execute function delta, emit signal to cards. 
		# If criteria met, card gives Master the id of the card.
		# Master takes id and data inside the change signal to cards.
		# On change signal, card recieves and uses data.
		# We can optimise code by having one big signal and changing card data base on 
		# what data has been recieved, having less if statements with each created card.
		#################
		
func _on_LineEdit_input_text(user_input_text):
	var procesed_input = user_input_text.to_lower()
	var console_command = procesed_input.substr(1, procesed_input.length())
	
	## Here are all the commands. ##
	if procesed_input == "add_card":
		_create_card()
	if procesed_input == "exit":
		get_tree().quit()
	if procesed_input != "" and procesed_input.begins_with("/") == true:
		print(console_command)

func _create_card():
	id += 1
	randomize()
	# Make sure to randomise to get a new value.
	var card = round(rand_range(0,12))
	var color = round(rand_range(0,3))
	var cardcolor = colors[color]
	var cardsymbol = cards[card]
	var cardvalue = card + 2
	# Create an instance as child.
	var GrabedInstance= Carte.instance()
	self.add_child(GrabedInstance)
	label_text = ("%s de %s" % [cardsymbol, cardcolor])
	# After ading instance you can conect or emit signal with values, they have to be in order at the recepient.
	emit_signal("cardvalues", label_text ,cardvalue, cardcolor, id)
