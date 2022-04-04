extends RigidBody2D


export (int) var speed = 500
var shooter = ""




func _ready() -> void:
	apply_impulse(Vector2(),Vector2(speed,0).rotated(rotation))


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()




func _on_Timer_timeout() -> void:
	queue_free()



