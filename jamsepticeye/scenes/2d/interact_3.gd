extends Sprite2D
var timer = false
var whypostion = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pointer("table",$"../table")
	pointer("boombox",$"../boombox")
	pointer("calender",$"../calender")
	pointer("Couch",$"../Couch")
	
	
	
	
	
	if help.WhichInteractable != "none":
		$".".visible = true
	else:
		$".".visible = false
		timer = false

func _on_timer_timeout() -> void:
	if timer == true:
		timer = false
	if whypostion == true:
		whypostion = false
	elif whypostion == false:
		whypostion = true
func pointer(nam,thatone):
	if help.WhichInteractable == nam:
		if whypostion == false:
			$".".position.y = thatone.position.y
			$".".position.x = thatone.position.x
		elif whypostion == true:
			$".".position.y = thatone.position.y - 10
		if timer == false:
			$Timer.start()
			timer = true
			$".".position.x = thatone.position.x
