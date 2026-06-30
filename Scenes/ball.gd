extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready():
	velocity = Vector2(1, 1).normalized() * SPEED
	print(velocity)
func _physics_process(delta: float) -> void:
	# Add the gravity.
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	#var collision = move_and_collide(velocity * delta)
	#if not is_on_floor():
		#velocity += get_gravity() * delta
		#print(velocity)
	if collision:
		var reflect = collision.get_remainder().bounce(collision.get_normal())
		velocity = velocity.bounce(collision.get_normal())
		#velocity.x *= randf_range(0.97, 1.03)
		move_and_collide(reflect)
	if(velocity.y == 0):
		var x = randf_range(-1, 1)
		if(x >= 0):
			velocity.y += SPEED
		else:
			velocity.y += -SPEED
	if(velocity.x == 0):
		var x = randf_range(-1, 1)
		if(x >= 0):
			velocity.x += SPEED
		else:
			velocity.x += -SPEED
	#if(velocity.x < 1):
		#velocity.x += 2
	#if(velocity.y < 1):
		#velocity.y += 2
	print(velocity)

	move_and_slide()
