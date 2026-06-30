extends Node2D


var block = preload("res://Scenes/block.tscn")

func _ready():
	for j in range(1, 4):
		for i in range(1, 10):
			var instance = block.instantiate()
			instance.position.x = i * 120 - 10
			instance.position.y = 100 * j
			add_child(instance)
