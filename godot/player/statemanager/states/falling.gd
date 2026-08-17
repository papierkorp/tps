extends State

@export_category("References")
@export var player: PlayerController

var calculated_speed: float

const ALLOWED: Array[State.States] = [
	State.States.AIR_RISE,
	State.States.GLIDING,
	State.States.IDLE,
	State.States.MOVEMENT,
]

func Enter():
	if !player:
		return
	calculated_speed = player.SPEED

func Physics_Update(delta):
	if !player:
		return

	if Input.is_action_just_pressed("aircharge"):
		_emit_transition(State.States.AIR_RISE)

	if Input.is_action_just_pressed("jump"):
		_emit_transition(State.States.GLIDING)

	player.velocity += player.get_gravity() * delta * player.ACCELERATION

	player.air_control(calculated_speed, delta)

	player.move_and_slide()

	if player.is_on_floor():
		player.check_idle_state()
