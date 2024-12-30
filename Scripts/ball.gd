extends CharacterBody2D

const speed = 400.0

func _ready() -> void:
	set_velocity(Vector2(-speed,speed))


func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())

	var screen_size = get_viewport_rect().size
	screen_size = screen_size - Vector2(0, 25) # Ball size
	
	var ball_loc = get_position()
	
	if ball_loc.x < 0:
		print("YOU LOST")
	if ball_loc.x > screen_size.x:
		print("YOU WON")
	if ball_loc.y < 0:
		velocity = velocity.bounce(Vector2(0,1))
	if ball_loc.y > screen_size.y:
		velocity = velocity.bounce(Vector2(0,-1))
