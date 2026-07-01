extends CharacterBody2D


const SPEED = 900.0
const JUMP_VELOCITY = -400.0



@export var sound : AudioStreamPlayer
@onready var y = position.y
var detect = 1

func _physics_process(_delta: float) -> void:
	
	if(position.y != y):
		position.y = y
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		sound.play()
		velocity.x = direction * SPEED * detect
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.name == "Area2D"):
		detect = 0

func _on_area_2d_body_entered(_body: Node2D) -> void:
	print("ow")
	velocity.y = 0
