extends KinematicBody2D

var input_vector : Vector2
var velocity : Vector2
export (int) var acceleration = 150
export (int) var max_speed = 200

var rotation_direction : int
export (float) var rotation_speed = 2.0

export (float) var friction_weight = 0.02

signal add_score

var last_collision

func _physics_process(delta):
	input_vector.x = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
	
	rotation_direction = 0
	if Input.is_action_pressed("turn_left"):
		rotation_direction += -1
	if Input.is_action_pressed("turn_right"):
		rotation_direction += 1
	
	velocity += Vector2(input_vector.x * acceleration * delta, 0).rotated(rotation)
	velocity.x = clamp(velocity.x, -max_speed, max_speed)
	velocity.y = clamp(velocity.y, -max_speed, max_speed)
	
	if input_vector.x == 0:
		velocity = lerp(velocity, Vector2.ZERO, friction_weight)
	
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide(velocity)
	
	var collision = move_and_collide(Vector2.ZERO)
	if collision:
		if collision.collider.name == "TopWall":
			pass
		elif collision.collider.name == "BottomWall":
			pass
		elif collision.collider.name == "LeftWall":
			pass
		elif collision.collider.name == "RightWall":
			pass
		else:
			emit_signal("add_score")
