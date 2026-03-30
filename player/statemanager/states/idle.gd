extends State

@export_category("References")
@export var player: PlayerController

func Enter():
	print("idle state")
	if !player:
		return

	# Clear leftover horizontal velocity unless player is actively pressing input
	var input_dir := player.get_input_dir()
	if input_dir == Vector2.ZERO:
		player.velocity.x = 0
		player.velocity.z = 0

func Physics_Update(delta):
	if !player:
		return

	# Always apply gravity so is_on_floor() stays accurate
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * delta
		state_transition.emit("gliding")  # ← catches the ledge walk-off immediately
		return

	if Input.is_action_just_pressed("aircharge"):
		state_transition.emit("airhover")

  # Check for jump
	if Input.is_action_just_pressed("jump"): # and player.is_on_floor():
		state_transition.emit("jump")

	# Check for movement input
	var input_dir = Input.get_vector("move_left", "move_right", "move_forwards", "move_backwards")
	if input_dir.length() > 0:
		state_transition.emit("movement")
