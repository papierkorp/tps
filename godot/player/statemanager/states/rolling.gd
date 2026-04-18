extends State

@export_category("References")
@export var player: PlayerController

@export_category("Settings")
@export var roll_speed: float = 12.0
@export var roll_duration: float = 0.4
@export var roll_cooldown: float = 0.6

const ALLOWED: Array[State.States] = [
	State.States.IDLE,
	State.States.MOVEMENT,
	State.States.SPRINTING,
	State.States.FALLING,
]

var _roll_direction: Vector3
var _timer: float
var _cooldown_timer: float = 0.0

func Enter():
	if !player:
		return
	_timer = roll_duration

	var input_dir := player.get_input_dir()
	if input_dir.length() > 0.1:
		_roll_direction = player.get_movement_direction()
	else:
		_roll_direction = -player.camera_controller.camera.global_transform.basis.z
		_roll_direction.y = 0
		_roll_direction = _roll_direction.normalized()

	player.velocity.x = _roll_direction.x * roll_speed
	player.velocity.z = _roll_direction.z * roll_speed

func Exit():
	_cooldown_timer = roll_cooldown

func Physics_Update(delta):
	if !player:
		return

	# Count down cooldown even while in other states — tick it here
	# only when active so it doesn't run while we're not rolling
	_timer -= delta

	# Preserve momentum, suppress steering during roll
	player.velocity.x = _roll_direction.x * roll_speed
	player.velocity.z = _roll_direction.z * roll_speed

	# Still apply gravity so the roll sticks to slopes
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * delta

	player.move_and_slide()

	if _timer <= 0.0:
		player.check_idle_state()


func is_ready() -> bool:
	return _cooldown_timer <= 0.0

func tick_cooldown(delta: float) -> void:
	if _cooldown_timer > 0.0:
		_cooldown_timer -= delta
