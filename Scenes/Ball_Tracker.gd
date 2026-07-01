extends Label


func _process(_delta: float) -> void:
	text = "Balls left: " + str(globals.balls - 1)
	pass
