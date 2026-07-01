extends BaseBrick


func _ready() -> void:
	points = 300
	health = 3

func take_damage():
	health -= 1
	print("OW! Health: ", health)
	if(health <= 0):
		globals.point += points
		globals.blocks_left -= 1
		queue_free()
