extends Node2D

var timer = false
var shuttup = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")




func _process(delta: float) -> void:
	#if shuttup == true:
	if help.WhichInteractable == "table":
		#$Interact3.visible = true
		if timer == false:
			#$Interact3.position.y = $Area2D.position.y -100
			$Interact3.position.x = $Area2D.position.x

			timer = true
			$Timer.start()
			print(timer)
		if timer == true:
		#	$Interact3.position.y = $Area2D.position.y + 100
			$Timer.start()
	else:
			$Indfteract3.visible = false

func _on_timer_timeout() -> void:
	timer = false
	print(timer)
	shuttup = true
