extends KinematicBody2D

signal cleaned

func _physics_process(delta):
	var collision = move_and_collide(Vector2.ZERO);
	if collision:
		get_parent().remove_child(self)
