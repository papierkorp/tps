extends State

@export_category("References")
@export var player: PlayerController

func Enter():
	if !player:
		return

func Physics_Update(delta):
	if !player:
		return

	# Apply reduced gravity for falling effect
	if not player.is_on_floor():	
		player.velocity += player.get_gravity() * delta

	if Input.is_action_just_pressed("aircharge"):
		state_transition.emit("airhover")

	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		state_transition.emit("jump")

	# Transition to sprint state
	if Input.is_action_pressed("sprint"):
		state_transition.emit("sprinting")

	var input_dir := Input.get_vector("move_left", "move_right", "move_forwards", "move_backwards")
	var direction := Vector3(input_dir.x, 0, input_dir.y).rotated(Vector3.UP, player.camera_controller.camera_horizontal).normalized()

	if direction:
		player.velocity.x = direction.x * player.SPEED
		player.velocity.z = direction.z * player.SPEED
	else:
		state_transition.emit("idle")

	player.move_and_slide()
