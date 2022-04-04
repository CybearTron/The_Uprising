extends KinematicBody2D


var motion = Vector2(0,0)
export (int) var health = 20
export (int) var speed = 100
var enemy
var is_idle = true
export (int) var gravity = 300

func _physics_process(delta: float) -> void:
	$Label.text = str(health)
	motion.y = gravity * delta
	if health <= 0:
		queue_free()
	if enemy != null:
		is_idle = false
	if is_idle == false:
		motion = position.direction_to(enemy.global_position)*speed
	elif is_idle == true:
		motion.x= 0
	motion = move_and_slide(motion)



func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("friend"):
		enemy = body






func _on_Hitbox_body_entered(body: Node) -> void:
	if body.is_in_group("bullet"):
		health -=10
