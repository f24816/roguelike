extends Node2D

func _ready():
	randomize()
	position = Vector2(rand_range(0,500), rand_range(0,500))
