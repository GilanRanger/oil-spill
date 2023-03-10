extends Sprite

func _ready():
	self.set_position(Vector2(69.634, 5.784))

func _on_OilSpawner_game_over():
	self.set_position(Vector2(510, 295))
