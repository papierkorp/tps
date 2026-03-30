extends State

@export_category("References")
@export var player: PlayerController

@export_category("Settings")
@export var charge_speed: float = 15.0
@export var charge_height: float = 8.0

const ALLOWED: Array[State.States] = [State.States.AIR_HOVER]

var target_y: float

func Enter():
	print("air rise state")
	if !player:
		return
	target_y = player.global_position.y + charge_height
	player.velocity = Vector3.ZERO
	player.velocity.y = charge_speed

func Physics_Update(_delta):
	if !player:
		return

	player.velocity.x = 0
	player.velocity.z = 0
	player.velocity.y = charge_speed
	player.move_and_slide()

	if player.global_position.y >= target_y:
		_emit_transition(State.States.AIR_HOVER)
