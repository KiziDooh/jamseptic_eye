extends Node2D
var timed = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	help.room = "bedroom"
func _process(delta: float) -> void:
	if help.WhichInteractable == "table":
		if timed == 0:
			timed = 1
	if timed == 1:
		$MusicPlayer/Timer.start()
		timed = 2
func _on_timer_timeout() -> void:
	help.knock = true
	$MusicPlayer/AudioStreamPlayer2.play()
