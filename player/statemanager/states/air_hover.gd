extends State

@export_category("References")
@export var player: PlayerController

@export_category("Settings")
@export var min_aim_down: float = -0.2
@export var air_charge_max_distance: float = 100.0

const ALLOWED: Array[State.States] = [State.States.GLIDING, State.States.AIR_CHARGE]

func Enter():
	print("air hover state")
	if !player:
		return
	player.velocity = Vector3.ZERO

func Physics_Update(_delta):
	if !player:
		return

	player.velocity = Vector3.ZERO
	player.move_and_slide()

	var input_dir := player.get_input_dir()
	if input_dir != Vector2.ZERO:
		_emit_transition(State.States.GLIDING)
		return

	if Input.is_action_just_pressed("aircharge"):
		if player.can_air_charge():
			_emit_transition(State.States.AIR_CHARGE)
