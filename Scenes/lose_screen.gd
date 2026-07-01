extends Node2D

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		globals.balls = 3
		globals.point = 0
		get_tree().change_scene_to_file("res://Scenes/main_screen.tscn")
