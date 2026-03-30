extends State

@export_category("References")
@export var player: PlayerController



func Enter():
	print("crouch")
	if !player:
		return


func Physics_Update(_delta):
	if !player:
		return

	# Get input for air control
	var input_dir := player.get_input_dir()
	var direction := player.get_movement_direction()

	# Allow some air control
	if direction:
		var current_velocity = Vector2(player.velocity.x, player.velocity.z)
		current_velocity = lerp(current_velocity, Vector2(direction.x, direction.z) * player.SPEED, player.ACCELERATION * 0.5)
		player.velocity.x = current_velocity.x
		player.velocity.z = current_velocity.y

	# Transition to falling when moving downward
	if player.velocity.y < 0:
		state_transition.emit("falling")

	# Safety check if somehow on floor
	if player.is_on_floor():
		if input_dir.length() > 0:
			state_transition.emit("movement")
		else:
			state_transition.emit("idle")
