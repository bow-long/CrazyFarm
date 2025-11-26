extends CharacterBody2D


@onready var random_movement: Timer = $RandomMovement

enum states {IDLE,MOVING,DEAD}
var previous_state: states
var state: states = states.IDLE
#Will act as the health bar for the cow and will decide the state for which the cow will be in
var hunger

const friction = 1000
var speed =900 
var ydirection
var xdirection 
var direction 


func _ready() -> void:
	#Make a random input on spawn
	ydirection = randf_range(-1,1)
	xdirection = randf_range(-1,1)
	direction = Vector2(xdirection,ydirection)
	state = states.IDLE
	previous_state =state
func _physics_process(delta: float) -> void:

	if (state == states.MOVING):
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO

		
		
		velocity += direction * speed * delta
	else:
		velocity = Vector2.ZERO
	move_and_slide()


func _on_random_movement_timeout() -> void:
	random_movement.wait_time = randi_range(1,2)
	if previous_state == states.IDLE:
		state = states.MOVING
		previous_state = state
	elif previous_state == states.MOVING:
		state = states.IDLE
		previous_state = state
	ydirection = randf_range(-1,1)
	xdirection = randf_range(-1,1)
	direction = Vector2(xdirection,ydirection)
	print(direction)
