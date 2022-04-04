extends Node2D

onready var companion

func _ready() -> void:
	companion=Global.companion
	var companion_instance = companion.instance()
	companion_instance.global_position = $Player.global_position
	companion_instance.global_position.x -=50
	add_child(companion_instance)
