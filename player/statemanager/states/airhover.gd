extends State

@export_category("References")
@export var player: PlayerController

@export_category("Settings")
@export var charge_speed: float = 15.0       # upward velocity during charge
@export var charge_height: float = 8.0        # how high above entry point to rise
@export var min_aim_down: float = -0.2        # y threshold on camera forward to allow dash

enum Phase { CHARGING, HOVERING }
var phase: Phase
var target_y: float

func Enter():
	print("airhover state")
	if !player:
		return
	phase = Phase.CHARGING
	target_y = player.global_position.y + charge_height
	# Kill all momentum — only go straight up
	player.velocity = Vector3.ZERO
	player.velocity.y = charge_speed

func Physics_Update(_delta):
	if !player:
		return

	match phase:
		Phase.CHARGING:
			_charging()
		Phase.HOVERING:
			_hovering()

func _charging():
	player.velocity.x = 0
	player.velocity.z = 0
	player.velocity.y = charge_speed
	player.move_and_slide()

	if player.global_position.y >= target_y:
		phase = Phase.HOVERING
		player.velocity = Vector3.ZERO

func _hovering():
	# Lock in place
	player.velocity = Vector3.ZERO
	player.move_and_slide()

	# Cancel with any movement input → back to gliding
	var input_dir = Input.get_vector("move_left", "move_right", "move_forwards", "move_backwards")
	if input_dir != Vector2.ZERO:
		state_transition.emit("gliding")
		return

	# Dash only if aircharge pressed and camera is aimed downward
	if Input.is_action_just_pressed("aircharge"):
		var cam_forward := -player.camera_controller.camera.global_transform.basis.z
		if cam_forward.y < min_aim_down:
			state_transition.emit("aircharge")
		# if not aiming down enough, do nothing — prevents flying forever
