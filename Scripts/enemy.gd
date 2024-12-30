extends CharacterBody2D

var direction = 0
const SPEED = 400.0
@onready var node_height = $CollisionShape2D.get_shape().size.y
@export var ball: CharacterBody2D
var ball_pos


func _physics_process(delta: float) -> void:
	velocity = Vector2(0,0)
	
	if ball != null:
		ball_pos = ball.get_position()
	else:
		ball_pos = Vector2(0,0)

	var self_pos = get_position()
	if (ball_pos.y > self_pos.y):
		direction = 1 
	else:
		direction = -1
		
	velocity.y = direction * SPEED
	
	move_and_slide()

	var screen_size = get_viewport_rect().size
	screen_size = screen_size - Vector2(0, node_height)
	global_position = global_position.clamp(Vector2(0,0), screen_size)
