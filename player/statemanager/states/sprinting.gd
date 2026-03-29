extends State

@export_category("References")
@export var player: PlayerController

func Enter():
	print("sprinting state")
	if !player:
		return

func Physics_Update(_delta):
	if !player:
		return

	if Input.is_action_just_pressed("aircharge"):
		state_transition.emit("airhover")
		
	if Input.is_action_just_pressed("jump"): #and player.is_on_floor():
		state_transition.emit("sprintjump")

	# If sprint released, go back to movement
	if not Input.is_action_pressed("sprint"):
		state_transition.emit("movement")

	var input_dir := Input.get_vector("move_left", "move_right", "move_forwards", "move_backwards")
	var direction := Vector3(input_dir.x, 0, input_dir.y).rotated(Vector3.UP, player.camera_controller.camera_horizontal).normalized()

	if direction:
		player.velocity.x = direction.x * player.SPRINT_SPEED
		player.velocity.z = direction.z * player.SPRINT_SPEED
	else:
		state_transition.emit("idle")

	player.move_and_slide()
