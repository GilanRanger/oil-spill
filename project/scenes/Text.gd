extends CanvasLayer

signal start_game

func _input(event):
	if event is InputEventKey and event.scancode == KEY_SPACE:
		self.remove_child(get_child(0))
		self.remove_child(get_child(1))
		emit_signal("start_game")
