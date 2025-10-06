extends Control
@onready var _speaker : Label = $"CanvasLayer/MarginContainer/Panel/VBoxContainer/Speaker Label"
@onready var _dialogue : RichTextLabel = $"CanvasLayer/MarginContainer/Panel/VBoxContainer/Dialogue Label"
@onready var _continue = $CanvasLayer/MarginContainer/Panel/Button

@onready var whichline = 1
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
	if help.room == "bedroom":
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
			
			
			
			
	if help.room == "tv":
		if whichline == 1:
				display_line("Wasn't expecting you... It's been a while","player")
				whichline = 2
		elif whichline == 2 and Input.is_action_just_released("interact"):
			help.friendspeak = 1
			whichline = 3
		elif help.friendspeak == 4:
			display_line("i'll think about it..","player")
			help.friendspeak = 0
			whichline = 5
		elif whichline == 5 and Input.is_action_just_released("interact"):
			display_line("I missed you tho...")
			whichline = 6
		elif whichline == 6 and Input.is_action_just_released("interact"):
			help.friendspeak = 5
			whichline = 0
			close()
		elif help.friendspeak == 20:
			display_line("Woooooaaahhh... you missed yourself")
			whichline = 7
			help.friendspeak = 0
		elif whichline == 7 and Input.is_action_just_released("interact"):
			help.friendspeak = 7
			whichline = 0
			close()
		elif help.friendspeak == 9:
			display_line("as if")
			whichline = 10
			help.friendspeak = 0
		elif whichline == 10 and Input.is_action_just_released("interact"):
			whichline = 0
			close()
			help.friendspeak = 10
			
		elif help.friendspeak == 12:
			display_line("im litterly NOT shut up!!")
			whichline = 11
			help.friendspeak = 13
		elif whichline == 11 and Input.is_action_just_released("interact"):
			whichline = 0
			close() 
			help.friendspeak = 14
		elif help.friendspeak == 16:
			whichline = 12
			help.friendspeak = 0
			display_line("im sorry...")
		elif whichline == 12 and Input.is_action_just_released("interact"):
			whichline = 0
			close() 
			help.friendspeak = 17
		elif help.friendspeak == 19:
			display_line("pssh over my dead body..")
			help.friendspeak = 21
		
		elif help.friendspeak == 21 and Input.is_action_just_released("interact"):
			display_line("","LATER THAT NIGHT")	
			help.friendspeak = 22
		elif help.friendspeak == 22 and Input.is_action_just_released("interact"):
			get_tree().change_scene_to_file("res://scenes/2d/Suicide_Sam.tscn") 

		
	if help.room == "sam":
		if whichline == 1:
			display_line("im so stupid...")
			whichline = 2
		elif whichline == 2 and Input.is_action_just_released("interact"):
			display_line("i was so annoying.")
			whichline = 3
		elif whichline == 3 and Input.is_action_just_released("interact"):
			display_line("","i was right")
			whichline = 4
		elif whichline == 4 and Input.is_action_just_released("interact"):
			help.dying = true
			whichline = 5
	if help.room == "suicide":
		placeholder = help.WhichInteractable
		if help.WhichInteractable != placeholder:
			whichline = 1
			
		if help.WhichInteractable == "boombox":
				if whichline == 1 and Input.is_action_just_released("interact"):
					display_line("Me and friend always used to listen to all the new fbn releases in this")
					whichline = 2
				elif whichline == 2 and Input.is_action_just_released("interact"):
					display_line("","I bet he hated it...")
					whichline = 3
				elif whichline == 3 and Input.is_action_just_released("interact"):
					whichline = 1
					
		if help.WhichInteractable == "calender":
				if whichline == 1 and Input.is_action_just_released("interact"):
					display_line("It's finally the day.. heh.. finally..")
					whichline = 2
				elif whichline == 2 and Input.is_action_just_released("interact"):
					display_line("","It's Over.")
					whichline = 3
				elif whichline == 3 and Input.is_action_just_released("interact"):
					whichline = 1
					
		if help.WhichInteractable == "table":
				if whichline == 1 and Input.is_action_just_released("interact"):
					display_line("Me and my Friend used to always eat here...")
					whichline = 2
				elif whichline == 2 and Input.is_action_just_released("interact"):
					display_line("","I know I annoyed him.")
					whichline = 3
				elif whichline == 3 and Input.is_action_just_released("interact"):
					whichline = 1
					
		if help.WhichInteractable == "Couch":
				if whichline == 1 and Input.is_action_just_released("interact"):
					display_line("my only friend the couch")
					whichline = 2
				elif whichline == 2 and Input.is_action_just_released("interact"):
					display_line("I practically didn't leave it for a month")
					whichline = 3
				elif whichline == 3 and Input.is_action_just_released("interact"):
					whichline = 1

		if help.WhichInteractable == "curtains1":
				if whichline == 1 and Input.is_action_just_released("interact"):
					display_line("...")
					whichline = 2
				elif whichline == 2 and Input.is_action_just_released("interact"):
					whichline = 1
		if help.WhichInteractable == "curtains2":
			if whichline == 1 and Input.is_action_just_released("interact"):
				display_line("A normal chair")
				whichline = 2
			elif whichline == 2 and Input.is_action_just_released("interact"):
				whichline = 1
		


		if Input.is_action_just_pressed("ui_text_newline"):
			close()
	if help.room == "funeral":
		placeholder = help.WhichInteractable
		if help.WhichInteractable != placeholder:
			whichline = 1
			
		if help.WhichInteractable == "mom":
				if whichline == 1 and Input.is_action_just_released("interact"):
					display_line("Why... why.. my poor sweet baby girl","mom")
					whichline = 2
				elif whichline == 2 and Input.is_action_just_released("interact"):
					display_line("im sorry mom","you")
					whichline = 3
				elif whichline == 3 and Input.is_action_just_released("interact"):
					whichline = 1
					
		if help.WhichInteractable == "fren":
				if whichline == 1 and Input.is_action_just_released("interact"):
					display_line("...")
					whichline = 2
				elif whichline == 2 and Input.is_action_just_released("interact"):
					display_line("...","You")
					whichline = 3
				elif whichline == 3 and Input.is_action_just_released("interact"):
					whichline = 1
					get_tree().change_scene_to_file("res://scenes/2d/Fren_Car_Crash.tscn") 
		
		
		


		if Input.is_action_just_pressed("ui_text_newline"):
			close()
			
	if help.room == "crash":
		placeholder = help.WhichInteractable
		if help.WhichInteractable != placeholder:
			whichline = 1
			
		if help.WhichInteractable == "deadboi":
				if whichline == 1 and Input.is_action_just_released("interact"):
					display_line("","")
					whichline = 2
				elif whichline == 2 and Input.is_action_just_released("interact"):
					display_line("","")
					whichline = 3
				elif whichline == 3 and Input.is_action_just_released("interact"):
					whichline = 1
					get_tree().change_scene_to_file("res://scenes/2d/dead.tscn") 
					
		if Input.is_action_just_pressed("ui_text_newline"):
			close()
