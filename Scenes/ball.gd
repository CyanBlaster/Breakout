extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready():
	velocity = Vector2(-1, 1).normalized() * SPEED
	print(velocity)
func _physics_process(delta: float) -> void:
	# Add the gravity.
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	#var collision = move_and_collide(velocity * delta)
	if not is_on_floor():
		velocity += get_gravity() * delta
		#print(velocity)
	print(collision)
	if collision:
		var reflect = collision.get_remainder().bounce(collision.get_normal())
		velocity = velocity.bounce(collision.get_normal())
		move_and_collide(reflect)
	
	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction: 
		#velocity.x = direction * SPEED
	#else:
	#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
