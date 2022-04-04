extends Node

var player_position
onready var companion

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_home"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("ui_end"):
		get_tree().change_scene("res://scenes/Companion Chooser.tscn")
