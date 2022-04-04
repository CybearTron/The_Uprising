extends KinematicBody2D


var motion = Vector2(0,0)
export (int) var gravity = 400
export (int) var speed = 5
export (int) var jump_speed = 300

onready var bullet = preload("res://scenes/Bullet.tscn")


func _physics_process(delta: float) -> void:

	Global.player_position = global_position
	if Input.is_action_pressed("ui_right"):
		motion.x +=speed
	elif Input.is_action_pressed("ui_left"):
		motion.x -=speed
	else:
		#motion.x = 0
		motion.x = lerp(motion.x,0,0.1)
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y += -jump_speed
	if Input.is_action_just_pressed("ui_accept"):
		var b = bullet.instance()
		b.shooter = "player"
		b.global_position = $Gun/Bullet_Pos.global_position
		b.global_rotation = $Gun.global_rotation
		get_parent().add_child(b)
		
		
	$Gun.look_at(get_global_mouse_position())
	
	
	motion.y += gravity * delta
	
	motion = move_and_slide(motion,Vector2.UP)
	
	
