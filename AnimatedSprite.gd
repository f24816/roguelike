extends AnimatedSprite


func _ready():
	self.position = Vector2(rand_range(0,500), rand_range(0,500))
