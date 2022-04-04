extends KinematicBody2D


onready var bullet = preload("res://scenes/Bullet.tscn")
export (int) var health = 20
var can_fire = false
var enemy
var is_idle = true


func _physics_process(delta: float) -> void:
	$Label.text = str(health)
	
	if health <= 0:
		queue_free()
	if enemy != null:

		is_idle = false
	if is_idle == false:
		$Gun.global_rotation = get_angle_to(enemy.global_position)
		
	if can_fire == true:
		_shoot()



func _shoot():
	can_fire = false
	var b = bullet.instance()
	b.global_rotation = $Gun.global_rotation
	b.global_position = $Gun/Bullet_Pos.global_position
	
	get_parent().add_child(b)



func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("friend"):
		enemy = body



func _on_Hitbox_body_entered(body: Node) -> void:
	if body.is_in_group("bullet"):
		health -=10
		


func _on_Shoot_Timer_timeout() -> void:
	can_fire = true
