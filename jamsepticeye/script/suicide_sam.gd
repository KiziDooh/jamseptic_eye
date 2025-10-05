extends Node2D

var start = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	help.room = "sam"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	if help.dying == true:
		if start == false:
			$AudioStreamPlayer2.stop()
			$AudioStreamPlayer.play()
			start = true
		if $AudioStreamPlayer.playing == false and start == true:
			print("hello there")
			get_tree().change_scene_to_file("res://scenes/2d/Suicide_Room.tscn") 
