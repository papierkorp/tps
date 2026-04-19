extends State

@export_category("References")
@export var player: PlayerController
@export var anim_player: AnimationPlayer

const ALLOWED: Array[State.States] = [State.States.MOVEMENT ,State.States.IDLE ,State.States.FALLING, State.States.AIR_RISE, State.States.JUMP, State.States.CROUCH]

func Enter():
	if !player:
		return

	# Clear leftover horizontal velocity unless player is actively pressing input
	# fix the bug that i jump in the last movementdirection even if i
	# stand still
	var input_dir := player.get_input_dir()
	if input_dir == Vector2.ZERO:
		player.velocity.x = 0
		player.velocity.z = 0
	anim_player.play("idle")

func Physics_Update(delta):
	if !player:
		return

	# Always apply gravity so is_on_floor() stays accurate
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * delta
		_emit_transition(State.States.FALLING)  # walking of ledges
		return

	if Input.is_action_just_pressed("aircharge"):
		_emit_transition(State.States.AIR_RISE)

	if Input.is_action_just_pressed("crouch"):
		_emit_transition(State.States.CROUCH)

	# Check for jump
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		_emit_transition(State.States.JUMP)

	# Check for movement input
	var input_dir := player.get_input_dir()
	if input_dir.length() > 0:
		_emit_transition(State.States.MOVEMENT)

func Exit() -> void:
	anim_player.stop()
