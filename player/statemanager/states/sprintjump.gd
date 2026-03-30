extends State

@export_category("References")
@export var player: PlayerController

@export_category("Settings")
@export var sprint_jump_multiplier: float = 1.5

var calculated_speed: float

func Enter():
	print("sprintjump state")
	if !player:
		return

	calculated_speed = player.SPRINT_SPEED
	player.velocity.y = player.JUMP_VELOCITY * sprint_jump_multiplier

func Physics_Update(delta):
	if !player:
		return

	if Input.is_action_just_pressed("aircharge"):
		state_transition.emit("airhover")

	player.velocity += player.get_gravity() * delta

	var input_dir := player.get_input_dir()
	var direction := player.get_movement_direction()

	if input_dir.length() > 0.1 and direction:
		var current_velocity = Vector2(player.velocity.x, player.velocity.z)
		current_velocity = lerp(current_velocity, Vector2(direction.x, direction.z) * calculated_speed, 1.0)
		player.velocity.x = current_velocity.x
		player.velocity.z = current_velocity.y

	player.move_and_slide()

	# Can glide after a sprint jump
	if player.velocity.y < 0:
		state_transition.emit("gliding")

	if player.is_on_floor():
		state_transition.emit("movement" if input_dir.length() > 0 else "idle")
