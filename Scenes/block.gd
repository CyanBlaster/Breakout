extends StaticBody2D

class_name BaseBrick

var points = 100
var health = 1

func take_damage():
	health -= 1
	if(health <= 0):
		globals.point += points
		queue_free()
