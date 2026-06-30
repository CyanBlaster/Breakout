extends StaticBody2D

class_name BaseBrick

var points = 100
var health = 1


func take_damage():
	health -= 1
	
	
func _process(_delta: float) -> void:
	if(health <= 0):
		points += 100
		queue_free()
	



func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name != "block"):
		take_damage()
