extends Node2D


var value = "Hello, I am genius, it works!"
signal cardvalue(value)
const Carte = preload("res://Carte.tscn")
var cards = [2, 3, 4, 5, 6, 7, 8, 9, 10,"A","J","Q","K"]
var colors = ["trefla","inima","inima neagra","romb"]
onready var Card = get_node("Card").get_node("Label")

func _ready():	
	$Card.connect("spawn_man", self, "_on_Card_spawn_man")
	var i = 0
	
	while i < 1:
		i += 1
		randomize()
		
		var card = round(rand_range(0,13))
		var color = round(rand_range(0,3))
		var cardvalue = card + 2
		var hand =[]
		
		var GrabedInstance= Carte.instance()
		self.add_child(GrabedInstance)
		
		print(cards[card])
		print(colors[color])
		print("Card value is", cardvalue)
		emit_signal("cardvalue", value)

func _on_Card_spawn_man():
	pass
