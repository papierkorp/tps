extends State

@export_category("References")
@export var player: PlayerController
@export var impact_scene: PackedScene

@export_category("Settings")
@export var dash_speed: float = 40.0

const ALLOWED: Array[State.States] = [State.States.IDLE, State.States.MOVEMENT]

var dash_direction: Vector3

func Enter():
	print("aircharge state")
	if !player:
		return
	# Snapshot the camera direction at the moment of input
	dash_direction = -player.camera_controller.camera.global_transform.basis.z
	player.velocity = dash_direction * dash_speed

func Physics_Update(_delta):
	if !player:
		return

	# Hold the velocity constant — no gravity, no steering
	player.velocity = dash_direction * dash_speed
	player.move_and_slide()

	if player.is_on_floor():
		if impact_scene:
			var impact = impact_scene.instantiate()
			get_tree().current_scene.add_child(impact)


			var collision := player.get_last_slide_collision()
			if collision:
				impact.global_position = collision.get_position()
				impact.global_basis = Basis(
					collision.get_normal().cross(Vector3.RIGHT).normalized(),
					collision.get_normal(),
					collision.get_normal().cross(Vector3.UP).normalized()
				)
				print("impact in tree: ", impact.is_inside_tree())
				print("impact parent:  ", impact.get_parent())
			else:
				impact.global_position = player.global_position

		var input_dir := player.get_input_dir()
		if input_dir.length() > 0:
			_emit_transition(State.States.MOVEMENT)
		else:
			_emit_transition(State.States.IDLE)
