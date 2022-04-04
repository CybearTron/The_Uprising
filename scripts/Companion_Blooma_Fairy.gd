extends KinematicBody2D

var motion = Vector2(0,0)
export (int) var speed = 250
export (int) var health = 40
var is_idle = true
var player
var enemy


func _physics_process(delta: float) -> void:

	$Label.text = str(health)
	if health <= 0:
		
		get_tree().reload_current_scene()
	if player != null:
		if Input.is_action_pressed("ui_focus_next"):
			player.speed = 13
		else:
			player.speed = 5
		if global_position.distance_to(player.global_position) > 100:
			is_idle = true
		elif global_position.distance_to(player.global_position) <=100:
			is_idle = false
		if is_idle == true:
			motion = global_position.direction_to(player.global_position)*speed
			motion = move_and_slide(motion)

func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		player = body


func _on_Hitbox_body_entered(body: Node) -> void:
	if body.is_in_group("bullet"):
		health -= 10











