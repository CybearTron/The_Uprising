extends Node2D

var companion = ""


func _physics_process(delta: float) -> void:
	if companion == "Blooma":
		#blooma
		Global.companion = preload("res://scenes/Companion_Blooma_Fairy.tscn")
		_change_scene()
	if companion == "Mierko":
		Global.companion = preload("res://scenes/Companion_Mierko_Bird.tscn")
		_change_scene()
	if companion == "Kruger":
		
		Global.companion = preload("res://scenes/Companion_Kruger_Bat.tscn")
		_change_scene()


func _change_scene():
	get_tree().change_scene("res://scenes/Game.tscn")

func _on_Blooma_body_entered(body: Node) -> void:
	if body.is_in_group("bullet"):
		
		companion = "Blooma"


func _on_Mierko_body_entered(body: Node) -> void:
	if body.is_in_group("bullet"):
		companion = "Mierko"


func _on_Kruger_body_entered(body: Node) -> void:
	if body.is_in_group("bullet"):
		companion = "Kruger"
