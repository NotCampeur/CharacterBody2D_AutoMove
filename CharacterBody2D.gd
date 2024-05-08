extends CharacterBody2D

signal destination_reached

var goal_position = Vector2()
var value_to_add_per_second = Vector2()
var time_needed_to_add: float = 0.0

func _physics_process(p_delta):
	if time_needed_to_add > 0:
		time_needed_to_add -= p_delta
		# Set the value to avoid us some trouble with floating points
		if time_needed_to_add <= 0: 
			position = goal_position
			destination_reached.emit()
		else:
			position += value_to_add_per_second * p_delta


func move_to(p_to_reach: Vector2, p_travel_time: float) -> void:
	goal_position = p_to_reach
	var difference: Vector2 = p_to_reach - position

	value_to_add_per_second = difference / p_travel_time
	time_needed_to_add = p_travel_time