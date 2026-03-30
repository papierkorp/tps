extends State

@export_category("References")
@export var player: PlayerController

@export_category("Settings")
@export var dash_speed: float = 40.0

const ALLOWED: Array[State.States] = [State.States.IDLE, State.States.MOVEMENT]

var dash_direction: Vector3

func Enter():
	print("aircharge state")
	if !player:
		return
	# Snapshot the camera direction at the moment of input
	dash_direction = -player.camera_controller.camera.global_transform.basis.z
	player.velocity = dash_direction * dash_speed

func Physics_Update(_delta):
	if !player:
		return

	# Hold the velocity constant — no gravity, no steering
	player.velocity = dash_direction * dash_speed
	player.move_and_slide()

	if player.is_on_floor():
		var input_dir := player.get_input_dir()
		if input_dir.length() > 0:
			_emit_transition(State.States.MOVEMENT)
		else:
			_emit_transition(State.States.IDLE)
