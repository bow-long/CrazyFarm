extends CharacterBody2D
class_name cow

@onready var random_movement: Timer = $RandomMovement
@onready var label: Label = $Label
@onready var healthAtt: healthattachment = $Healthattachment


@onready var age : int = 0
@onready var growth_stage : int = 0
var hunger_rate : int = 10

enum states {IDLE,HUNGRY,DEAD}
var previous_state: states
var state: states = states.IDLE


const friction : int = 1000
var speed  = 10 
var ydirection : float
var xdirection : float 
var direction : Vector2 
var distance : int = 20
var target  : Vector2



func _ready() -> void:
	#Make a random input on spawn
	ydirection = randf_range(-1,1)
	xdirection = randf_range(-1,1)
	direction = Vector2(xdirection,ydirection).normalized()
	state = states.IDLE
	previous_state =state
	
	target = position + direction * 10
	
func _physics_process(delta: float) -> void:
	velocity += position.direction_to(target) * speed * delta	
	if state == states.HUNGRY:
		# go to the nearest foodt sources
		pass
	if position.distance_to(target) > 10:
		move_and_slide()
		
# age the cow 
func _mature():
	if (age % 15 == 0):
		growth_stage += 1
	age += 1
	healthAtt.damage(hunger_rate)
	
func _handle_state():
	random_movement.wait_time = randi_range(1,2)
	if previous_state == states.IDLE:
		previous_state = state
	ydirection = randf_range(-1,1)
	xdirection = randf_range(-1,1)
	direction = Vector2(xdirection,ydirection).normalized()
	target = position + direction * distance
	
func _find_nearest_grass():
	print("hellooooo")
	var grasses = get_tree().get_nodes_in_group("grass")
	for g in grasses:
		if g.has_pred():
			return 
		else:
			g.new_pred(self)
func _on_random_movement_timeout() -> void:
	_handle_state()
	_mature()
	label.text = str(healthAtt.health)
	print(direction)
