extends State

@export_category("References")
@export var player: PlayerController

@export_category("Movement Settings")
@export var air_acceleration: float = 0.3  # How much control in air
@export var glide_gravity_multiplier: float = 0.1  # Lower = more gliding
@export var air_nudge_force: float = 18.0     # how strongly input nudges direction
@export var max_air_speed: float = 10.0       # horizontal speed cap
@export var air_drag: float = 0.98            # horizontal momentum retention (1.0 = no drag)

const ALLOWED: Array[State.States] = [State.States.AIR_CHARGE, State.States.FALLING]

func Enter():
	if !player:
		return
		
	# kill momentum
	player.velocity.y = 0.0
	player.velocity.x *= 0.3
	player.velocity.z *= 0.3

func Physics_Update(delta):
	if !player:
		return

	if Input.is_action_just_pressed("aircharge"):
		if player.can_air_charge():
			_emit_transition(State.States.AIR_CHARGE)

	if Input.is_action_just_pressed("jump"):
		_emit_transition(State.States.FALLING)

	# Reduced gravity — multiplier actually applied this time
	player.velocity += player.get_gravity() * glide_gravity_multiplier * delta

	var direction := player.get_movement_direction()

	if direction:
		player.velocity.x += direction.x * air_nudge_force * delta
		player.velocity.z += direction.z * air_nudge_force * delta

	# Soft horizontal speed cap
	var horizontal := Vector2(player.velocity.x, player.velocity.z)
	if horizontal.length() > max_air_speed:
		horizontal = horizontal.normalized() * max_air_speed
		player.velocity.x = horizontal.x
		player.velocity.z = horizontal.y

	# Momentum drag
	player.velocity.x *= air_drag
	player.velocity.z *= air_drag

	player.move_and_slide()
	player.check_idle_state()
