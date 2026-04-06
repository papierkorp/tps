extends State

@export_category("References")
@export var player: PlayerController

const ALLOWED: Array[State.States] = [State.States.IDLE, State.States.MOVEMENT, State.States.SPRINT_JUMP, State.States.AIR_RISE]

func Enter():
	print("sprinting state")
	if !player:
		return

func Physics_Update(_delta):
	if !player:
		return

	if Input.is_action_just_pressed("aircharge"):
		_emit_transition(State.States.AIR_RISE)
		
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		_emit_transition(State.States.SPRINT_JUMP)

	# If sprint released, go back to movement
	if not Input.is_action_pressed("sprint"):
		_emit_transition(State.States.MOVEMENT)

	var direction := player.get_movement_direction()
	
	if direction:
		player.velocity.x = direction.x * player.SPRINT_SPEED
		player.velocity.z = direction.z * player.SPRINT_SPEED
	
	if player.get_input_dir().length() < 0.1:
		_emit_transition(State.States.IDLE)

	player.move_and_slide()
