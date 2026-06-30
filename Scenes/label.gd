extends Label

var points = 0


func _process(_delta: float) -> void:
	text = "Score:" + str(globals.point)
	pass
