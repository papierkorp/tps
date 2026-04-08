extends State

@export_category("References")
@export var player: PlayerController

var calculated_speed: float

const ALLOWED: Array[State.States] = [State.States.FALLING, State.States.AIR_RISE]

func Enter():
	if !player:
		return
	
	calculated_speed = player.SPEED
	player.velocity.y = player.JUMP_VELOCITY

func Physics_Update(delta):
	if !player:
		return

	if Input.is_action_just_pressed("aircharge"):
		_emit_transition(State.States.AIR_RISE)

	player.velocity += player.get_gravity() * delta

	player.air_control(calculated_speed, delta)

	player.move_and_slide()

	if player.velocity.y < 0:
		_emit_transition(State.States.FALLING)
	
	player.check_idle_state()
