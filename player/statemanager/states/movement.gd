extends State

@export_category("References")
@export var player: PlayerController

const ALLOWED: Array[State.States] = [State.States.AIR_RISE, State.States.JUMP, State.States.CROUCH, State.States.SPRINTING, State.States.IDLE, State.States.FALLING, State.States.ROLLING]

func Enter():
	if !player:
		return

func Physics_Update(delta):
	if !player:
		return

	# Apply reduced gravity for falling effect
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * delta # walking of ledges
		_emit_transition(State.States.FALLING)

	if Input.is_action_just_pressed("aircharge"):
		_emit_transition(State.States.AIR_RISE)

	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		_emit_transition(State.States.JUMP)

	if Input.is_action_just_pressed("roll"):
		_emit_transition(State.States.ROLLING)

	# Transition to sprint state
	if Input.is_action_pressed("sprint"):
		_emit_transition(State.States.SPRINTING)

	if Input.is_action_just_pressed("crouch"):
		_emit_transition(State.States.CROUCH)

	var direction := player.get_movement_direction()
	
	if direction:
		player.velocity.x = direction.x * player.SPEED
		player.velocity.z = direction.z * player.SPEED
		
	if player.get_input_dir().length() < 0.1:
		_emit_transition(State.States.IDLE)

	player.move_and_slide()
