extends Control
@onready var _speaker : Label = $"CanvasLayer/MarginContainer/Panel/VBoxContainer/Speaker Label"
@onready var _dialogue : RichTextLabel = $"CanvasLayer/MarginContainer/Panel/VBoxContainer/Dialogue Label"
@onready var _continue = $CanvasLayer/MarginContainer/Panel/Button

func display_line(line : String, speaker : String = ""):
	_speaker.visible = (speaker != "")
	_speaker.text = speaker
	_dialogue.text = line
	open()
	_continue.grab_focus()
	
func open():
	$CanvasLayer.visible = true
	
func close():
	$CanvasLayer.visible = false

func _on_button_pressed():
	close()

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_text_newline"):
		close()
