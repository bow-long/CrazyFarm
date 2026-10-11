extends Node2D
class_name grass

var pred : cow = null

func _ready() -> void:
	var cows = get_tree().get_nodes_in_group("cow")
	var lowest_health : int = INF
	var dist = 1000
	for c : cow in cows: 
		var temp_dis = c.position.direction_to(self.position) 
		if c.healthAtt.health < lowest_health and (temp_dis < dist):
			pred = c
			dist = pred.position.direction_to(self.position)


	if pred == null:
		pass
	else:
		pred.target = self.position
		
func new_pred(f : cow):
	pred = f

func has_pred() -> bool:
	return pred != null
