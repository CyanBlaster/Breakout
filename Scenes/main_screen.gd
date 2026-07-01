extends Node2D


var block = preload("res://Scenes/block.tscn")
var tough_block = preload("res://Scenes/tough_block.tscn")
var bricks = 0

func _ready():
	for j in range(2, 4):
		for i in range(1, 10):
			var instance = block.instantiate()
			instance.position.x = i * 120 - 10
			instance.position.y = 100 * j
			bricks += 1
			add_child(instance)
	for i in range(1, 9):
			var instance = tough_block.instantiate()
			instance.position.x = i * 130 - 10
			instance.position.y = 100
			bricks += 1
			add_child(instance)
	globals.blocks_left = bricks
	bricks = 0
