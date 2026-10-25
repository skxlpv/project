extends CharacterBody2D

const SPEED:float = 600.0
const JUMP_VELOCITY: float = -1000.0
const GRAVITY: float = 2700.0
@onready var player_body: CharacterBody2D = $Body

func input_handler(direction, _delta):
	if not is_on_floor(): velocity.y += GRAVITY * _delta # gravity
	
	# JUMP
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# LEFT AND RIGHT
	if direction: 	velocity.x = direction * SPEED
	else:			velocity.x = move_toward(velocity.x, 0, SPEED)


#========================= MAIN FUNCTION ===========================
func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	
	input_handler(direction, delta)
	move_and_slide()
