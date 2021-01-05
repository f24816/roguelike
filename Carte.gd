extends Node2D
signal spawn_man

func _ready():
	randomize()
	position = Vector2(rand_range(0,500), rand_range(0,500))
func _process(delta):
	emit_signal("spawn_man")
