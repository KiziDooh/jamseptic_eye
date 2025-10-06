extends Control
@onready var _speaker : Label = $"CanvasLayer/MarginContainer/Panel/VBoxContainer/Speaker Label"
@onready var _dialogue : RichTextLabel = $"CanvasLayer/MarginContainer/Panel/VBoxContainer/Dialogue Label"
@onready var _continue = $CanvasLayer/MarginContainer/Panel/Button

var placeholder = "bobross"



func _ready() -> void:
	close()

func display_line(line : String, speaker : String = ""):
	_speaker.visible = (speaker != "")
	_speaker.text = speaker
	_dialogue.text = line
	open()
	_continue.grab_focus()
	
func open():
	$CanvasLayer.visible = true
	if placeholder != "bobross":
		$AudioStreamPlayer.play()
	
func close():
	$CanvasLayer.visible = false
	if placeholder != "bobross":
		$AudioStreamPlayer.play()
func _on_button_pressed():
	close()

func _physics_process(delta: float) -> void:
	if help.friendspeak == 1 and Input.is_action_just_released("interact"):
		placeholder = "hello"
		display_line("Yaaah... it's been foooorever","Travis")
		help.friendspeak = 2
	elif help.friendspeak == 2 and Input.is_action_just_released("interact"):
		display_line("We neeed to hang out more","Travis")
		help.friendspeak = 3
	elif help.friendspeak == 3 and Input.is_action_just_released("interact"):
		help.friendspeak = 4
		close()
	elif help.friendspeak == 5 and Input.is_action_just_released("interact"):
		display_line("me too","Travis")
		help.friendspeak = 6
	elif help.friendspeak == 6 and Input.is_action_just_released("interact"):
		help.friendspeak = 20
		close()
	elif help.friendspeak == 7 and Input.is_action_just_released("interact"):
		display_line("*psshhh* your sooooo.. funny","Travis")
		help.friendspeak = 8
	elif help.friendspeak == 8 and Input.is_action_just_released("interact"):
		help.friendspeak = 9
		close()
	elif help.friendspeak == 10 and Input.is_action_just_released("interact"):
		display_line("I mean it","Travis")
		help.friendspeak = 11
	elif help.friendspeak == 11 and Input.is_action_just_released("interact"):
		close()
		help.friendspeak = 12
		
	elif help.friendspeak == 14:
		display_line("ok jeesh... I get it","Travis")
		help.friendspeak = 15
	elif help.friendspeak == 15 and Input.is_action_just_released("interact"):
		close()
		help.friendspeak = 16
	elif help.friendspeak == 17:
		display_line("Then you should give me all your ice cream :l","Travis")
		help.friendspeak = 18
	elif help.friendspeak == 18 and Input.is_action_just_released("interact"):
		close()
		help.friendspeak = 19
	 
		
	#if Input.is_action_just_pressed("interact"):
	#	close() 
