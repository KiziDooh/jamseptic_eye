extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func _on_button_pressed() -> void:
	print("wow")
	get_tree().change_scene_to_file("res://scenes/3d/3d_scene_1.tscn") 


func _on_button_2_pressed() -> void:
	pass # Replace with function body.
