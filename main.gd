extends Node2D

@onready var character = $CharacterBody2D

func _ready():
	character.destination_reached.connect(_on_destination_reached)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var target = get_global_mouse_position()
			print("Moving to: ", target)
			character.move_to(target, 1.5)

func _on_destination_reached():
	print("Character is at: ", character.global_position)
