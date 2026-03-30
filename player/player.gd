class_name PlayerController extends CharacterBody3D

@export_category("References")
@export var camera_controller: CameraController
@export var state: State

@export_category("Movement Settings")
@export var SPEED: float = 7.0
@export var SPRINT_SPEED: float = 15.0
@export var ACCELERATION: float = 2.0
@export var JUMP_VELOCITY: float = 8.0
@export var SPRINT_JUMP_MULTI: float = 1.5
@export var AIR_CONTROL: float = 1.5 # higher is snappier, lower is more sluggish

func Physics_Update(delta):
  # Apply reduced gravity for falling effect
	if not is_on_floor():
		velocity += get_gravity() * JUMP_VELOCITY * delta

# ---------------------------------------------------------
# ------------------------- Helper -------------------------
# ---------------------------------------------------------

func get_movement_direction() -> Vector3:
	var input_dir := Input.get_vector("move_left", "move_right", "move_forwards", "move_backwards")
	return Vector3(input_dir.x, 0, input_dir.y)\
		.rotated(Vector3.UP, camera_controller.camera_horizontal).normalized()

func get_input_dir() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_forwards", "move_backwards")

# ---------------------------------------------------------
# --------------------- Player Control ---------------------
# ---------------------------------------------------------

func air_control(calculated_speed: float, delta: float) -> void:
	var input_dir := get_input_dir()
	var input_strength := input_dir.length()  # 0.0 → 1.0
	if input_strength < 0.1:
		return
	
	var direction = get_movement_direction()
	
	var current_velocity := Vector2(velocity.x, velocity.z)
	# scaled by input
	var target_velocity := Vector2(direction.x, direction.z) * calculated_speed * input_strength  

	# Check if input is opposing current momentum
	var dot := current_velocity.dot(target_velocity.normalized()) 

	if dot < 0:
		# Input is backwards — only bleed off speed, don't propel backward
		current_velocity = current_velocity.move_toward(Vector2.ZERO, calculated_speed * AIR_CONTROL * delta)
	else:
		# Input is forward/sideways — normal air control
		current_velocity = lerp(current_velocity, target_velocity, AIR_CONTROL * delta)

	velocity.x = current_velocity.x
	velocity.z = current_velocity.y


# ---------------------------------------------------------
# ---------------------- Check States ----------------------
# ---------------------------------------------------------

func check_idle_state() -> void:
	if is_on_floor():
		if get_input_dir().length() > 0:
			state._emit_transition(State.States.MOVEMENT)
		else:
			state._emit_transition(State.States.IDLE)
