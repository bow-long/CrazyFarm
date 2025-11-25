extends CharacterBody2D




func dookiebot():
	velocity = 1

func _physics_process(delta: float) -> void:
	dookiebot()
	move_and_slide()
	
