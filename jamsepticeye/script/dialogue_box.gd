extends Control
@onready var _speaker : Label = $"CanvasLayer/MarginContainer/Panel/VBoxContainer/Speaker Label"
@onready var _dialogue : RichTextLabel = $"CanvasLayer/MarginContainer/Panel/VBoxContainer/Dialogue Label"
@onready var _continue = $CanvasLayer/MarginContainer/Panel/Button

var whichline = 1
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

	placeholder = help.WhichInteractable
	if help.WhichInteractable != placeholder:
		whichline = 1
		
	if help.WhichInteractable == "boombox":
			if whichline == 1 and Input.is_action_just_released("interact"):
				display_line("Me and friend always used to listen to all the new fbn releases in this")
				whichline = 2
			elif whichline == 2 and Input.is_action_just_released("interact"):
				display_line("I miss that...")
				whichline = 3
			elif whichline == 3 and Input.is_action_just_released("interact"):
				whichline = 1
				
	if help.WhichInteractable == "calender":
			if whichline == 1 and Input.is_action_just_released("interact"):
				display_line("It's finally the day.. heh.. finally..")
				whichline = 2
			elif whichline == 2 and Input.is_action_just_released("interact"):
				display_line("It'll be over...")
				whichline = 3
			elif whichline == 3 and Input.is_action_just_released("interact"):
				whichline = 1
				
	if help.WhichInteractable == "table":
			if whichline == 1 and Input.is_action_just_released("interact"):
				display_line("Me and Friend used to always eat here...")
				whichline = 2
			elif whichline == 2 and Input.is_action_just_released("interact"):
				display_line("I probably annoyed him.")
				whichline = 3
			elif whichline == 3 and Input.is_action_just_released("interact"):
				whichline = 1
				
	if help.WhichInteractable == "Couch":
			if whichline == 1 and Input.is_action_just_released("interact"):
				display_line("Ahhhh my good friend the couch")
				whichline = 2
			elif whichline == 2 and Input.is_action_just_released("interact"):
				display_line("We've been practically glued together for the last month")
				whichline = 3
			elif whichline == 3 and Input.is_action_just_released("interact"):
				whichline = 1

	if help.WhichInteractable == "curtains1" or help.WhichInteractable == "curtains2":
			if whichline == 1 and Input.is_action_just_released("interact"):
				display_line("It's quite a nice day.")
				whichline = 2
			elif whichline == 2 and Input.is_action_just_released("interact"):
				whichline = 1

	if Input.is_action_just_pressed("ui_text_newline"):
		close()
