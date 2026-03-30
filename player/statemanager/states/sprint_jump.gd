extends State

@export_category("References")
@export var player: PlayerController

@export_category("Settings")
@export var sprint_jump_multiplier: float = 1.5

var calculated_speed: float

const ALLOWED: Array[State.States] = [State.States.GLIDING, State.States.AIR_RISE]

func Enter():
	print("sprintjump state")
	if !player:
		return

	calculated_speed = player.SPRINT_SPEED
	player.velocity.y = player.JUMP_VELOCITY * sprint_jump_multiplier

func Physics_Update(delta):
	if !player:
		return

	if Input.is_action_just_pressed("aircharge"):
		_emit_transition(State.States.AIR_RISE)

	player.velocity += player.get_gravity() * delta

	var input_dir := player.get_input_dir()
	var direction := player.get_movement_direction()

	player.air_control(calculated_speed, delta)

	player.move_and_slide()

	# Can glide after a sprint jump
	if player.velocity.y < 0:
		_emit_transition(State.States.GLIDING)

	player.check_idle_state()
