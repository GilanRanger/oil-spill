extends Label

var score = 0

var game_over = false

func _ready():
	text = "Score: %s" % score

func _on_PlayerBoat_add_score():
	if game_over:
		return
	score += 1
	text = "Score: %s" % score

func _on_OilSpawner_game_over():
	score = 0
	text = "Game Over"
	self.set_position(Vector2(400, 275))
	game_over = true
