class_name healthattachment extends Node2D

@export var max_health: int
var health

func _ready() -> void:
	health = max_health


func damage(d):
	health-= d
	
	if health <= 0:
		get_parent().queue_free()
