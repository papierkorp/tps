extends State

@export_category("References")
@export var player: PlayerController

var calculated_speed: float

func _ready() -> void:
	calculated_speed = player.SPEED

func Enter():
	print("falling state")

func Physics_Update(delta):
	if !player:
		return

	if Input.is_action_just_pressed("aircharge"):
		state_transition.emit("airhover")

	player.velocity += player.get_gravity() * delta

	var input_dir = Input.get_vector("move_left", "move_right", "move_forwards", "move_backwards")
	var direction := Vector3(input_dir.x, 0, input_dir.y)\
		.rotated(Vector3.UP, player.camera_controller.camera_horizontal).normalized()

	# Limited air control while falling
	if direction:
		var current_velocity = Vector2(player.velocity.x, player.velocity.z)
		current_velocity = lerp(current_velocity, Vector2(direction.x, direction.z) * calculated_speed, 0.1)
		player.velocity.x = current_velocity.x
		player.velocity.z = current_velocity.y

	player.move_and_slide()

	if player.is_on_floor():
		state_transition.emit("movement" if input_dir.length() > 0 else "idle")
