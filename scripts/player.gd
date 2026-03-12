extends CharacterBody2D
var SPEED = 0

func _ready() -> void:
	if get_tree().current_scene.name == "Overworld":
		SPEED = 50
	else:
		SPEED = 125
		print("Current scene is: " + get_tree().current_scene.name)
#const SPEED = 125
const JUMP_VELOCITY = -400.0


func _physics_process(_delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#Inputs found in Project -> Project Settings -> Input Map
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	move_and_slide()
