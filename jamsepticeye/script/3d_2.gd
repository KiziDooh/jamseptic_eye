extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	help.fixitpls = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		$huggies.rotation.y = 	$ProtoController.rotation.y
