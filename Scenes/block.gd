extends StaticBody2D

class_name BaseBrick

var points = 100
var health = 1

func take_damage() -> void:
	health -= 1
	print("OW! Health: ", health)
	if(health <= 0):
		globals.point += points
		globals.blocks_left -= 1
		queue_free()
