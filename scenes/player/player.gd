extends CharacterBody2D

class_name player

const SPEED = 300.0
const JUMP_VELOCITY = -1000.0
var GRAVITY_MULTIPLIER = 3.0

func _ready() -> void:
	WorldManager.swap.connect(_on_swap)

func _on_swap(is_mirrored):
	GRAVITY_MULTIPLIER = 1.0 if is_mirrored else 3.0
	collision_layer = 2 if is_mirrored else 1
	collision_mask = 2 if is_mirrored else 1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * GRAVITY_MULTIPLIER

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_released("jump"):
		velocity.y = velocity.y * 0.5
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
