extends CharacterBody2D


const SPEED = 400.0
@onready var player_height = $CollisionShape2D.get_shape().size.y

func _physics_process(delta: float) -> void:
	velocity = Vector2(0,0)
	
	var direction := Input.get_axis("move_up", "move_down")
	if direction:
		velocity.y = direction * SPEED

	move_and_slide()

	var screen_size = get_viewport_rect().size
	screen_size = screen_size - Vector2(0, player_height)
	global_position = global_position.clamp(Vector2(0,0), screen_size)
