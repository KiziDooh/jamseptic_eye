extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var dialogue_box = $"../DialogueBox"



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	#flips sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	#idle and run
	if direction == 0:
		animated_sprite_2d.play("idle")
		pass
	else:
		animated_sprite_2d.play("walk")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()



func _on_boombox_body_entered(body: Node2D) -> void:
	help.WhichInteractable = "boombox"

func _on_boombox_body_exited(body: Node2D) -> void:
	help.WhichInteractable = "none"

func _on_table_body_entered(body: Node2D) -> void:
	help.WhichInteractable = "table"

func _on_table_body_exited(body: Node2D) -> void:
	help.WhichInteractable = "none"

func _on_calender_body_entered(body: Node2D) -> void:
	help.WhichInteractable = "calender"

func _on_calender_body_exited(body: Node2D) -> void:
	help.WhichInteractable = "none"

func _on_couch_body_entered(body: Node2D) -> void:
	help.WhichInteractable = "Couch"

func _on_couch_body_exited(body: Node2D) -> void:
	help.WhichInteractable = "none"

func _on_curtains_1_body_entered(body: Node2D) -> void:
	help.WhichInteractable = "curtains1"

func _on_curtains_1_body_exited(body: Node2D) -> void:
	help.WhichInteractable = "none"

func _on_curtains_2_body_entered(body: Node2D) -> void:
	help.WhichInteractable = "curtains2"

func _on_curtains_2_body_exited(body: Node2D) -> void:
	help.WhichInteractable = "none"

func _on_door_body_entered(body: Node2D) -> void:
	help.WhichInteractable = "door"

func _on_door_body_exited(body: Node2D) -> void:
	help.WhichInteractable = "none"

func _on_mom_body_entered(body: Node2D) -> void:
	help.WhichInteractable = "mom"

func _on_mom_body_exited(body: Node2D) -> void:
	help.WhichInteractable = "none"

func _on_fren_body_entered(body: Node2D) -> void:
	help.WhichInteractable = "fren"

func _on_fren_body_exited(body: Node2D) -> void:
	help.WhichInteractable = "none"

func _on_deadboi_body_entered(body: Node2D) -> void:
	help.WhichInteractable = "deadboi"

func _on_deadboi_body_exited(body: Node2D) -> void:
	help.WhichInteractable = "none"
