extends State

@export_category("References")
@export var player: PlayerController

@export_category("Settings")
@export var dash_speed: float = 40.0

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
		var input_dir = Input.get_vector("move_left", "move_right", "move_forwards", "move_backwards")
		state_transition.emit("movement" if input_dir.length() > 0 else "idle")
