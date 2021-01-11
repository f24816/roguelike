extends LineEdit

var user_input_text = ""
var history = {0: ""}
var command_number = -1
var command_pos = -1
signal input_text (user_input_text)

func _ready():
	pass
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		user_input_text = self.text
		emit_signal("input_text", user_input_text)
		
		command_number += 1 
		command_pos = command_number
		history[command_number] = user_input_text.to_lower()
		
		# /clear
		print(history)
		self.text = "" 
		command_pos += 1
	
	if Input.is_action_just_pressed("ui_up"):
		if command_pos > 0:
			command_pos -= 1
			self.text = history[command_pos]

	if Input.is_action_just_pressed("ui_down"):
		if command_pos < command_number:
			command_pos += 1
			self.text = history[command_pos]
