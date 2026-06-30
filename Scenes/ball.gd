extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready():
	velocity = Vector2(1, 1).normalized() * SPEED
	print(velocity)
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	var collision = move_and_collide(velocity * delta)

	if collision:
		var collider = collision.get_collider()
		print('son here 2', collider)
		if collider.is_in_group('bricks'):
			print('son here 3')
			collider.take_damage()
		#var reflect = collision.get_remainder().bounce(collision.get_normal())
		velocity = velocity.bounce(collision.get_normal())
		#velocity.x *= randf_range(0.97, 1.03)
		#move_and_collide(reflect)
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
	if(position.y >= 700):
		position.y = 450;
		position.x = 500

	#move_and_slide()
