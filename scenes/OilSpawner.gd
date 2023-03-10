extends Node2D

export (int) var max_x = 900
export (int) var min_x = 100
export (int) var max_y = 500
export (int) var min_y = 100

export (int) var game_over_num = 3

var game_running = false

onready var Oil = preload("res://objects/Oil.tscn")

signal game_over

func _ready():
	pass



func _on_OilSpawnTimer_timeout():
	if !game_running:
		return
	var oil = Oil.instance()
	add_child(oil)
	oil.position = Vector2(random_x(), random_y())
	if get_child_count() > game_over_num:
		emit_signal("game_over")

var rng = RandomNumberGenerator.new()
func random_x():
	return rng.randf_range(min_x, max_x)
	
func random_y():
	return rng.randf_range(min_y, max_y)


func _on_Text_start_game():
	game_running = true
