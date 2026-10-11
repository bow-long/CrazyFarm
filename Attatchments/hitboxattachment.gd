extends Area2D 

@export var health: healthattachment 

func damage(attack: Attack):
	if health:
		health.damage(attack)
