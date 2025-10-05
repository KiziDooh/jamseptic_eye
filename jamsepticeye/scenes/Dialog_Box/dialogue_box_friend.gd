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
		display_line("I had fun","friend")
		help.friendspeak = 2
	elif help.friendspeak == 2 and Input.is_action_just_released("interact"):
		help.friendspeak = 3
		close()
	#if Input.is_action_just_pressed("interact"):
	#	close() 
