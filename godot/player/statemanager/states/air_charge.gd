extends State

@export_category("References")
@export var player: PlayerController
@export var impact_scene: PackedScene

@export_category("Settings")
@export var dash_speed: float = 40.0

const ALLOWED: Array[State.States] = [
	State.States.IDLE,
	State.States.MOVEMENT,
	State.States.FALLING,
]

var dash_direction: Vector3
var _impacted: bool = false

func Enter():
	if !player:
		return

	_impacted = false

	var cam := player.camera_controller.camera
	var cam_forward := -cam.global_transform.basis.z
	var cam_origin := cam.global_position
	var hit := player.do_raycast(cam_forward, player.air_charge_max_distance, cam_origin)
	dash_direction = (hit.point - player.global_position).normalized()

	player.velocity = dash_direction * dash_speed

func Exit():
	_impacted = false

func Physics_Update(_delta):
	if !player:
		return

	player.velocity = dash_direction * dash_speed
	player.move_and_slide()

	# Any surface collision counts as an impact
	if !_impacted and player.get_slide_collision_count() > 0:
		_impacted = true
		_spawn_impact(player.get_slide_collision(0))

		if player.is_on_floor():
			var input_dir := player.get_input_dir()
			if input_dir.length() > 0:
				_emit_transition(State.States.MOVEMENT)
			else:
				_emit_transition(State.States.IDLE)
		else:
			# Hit a wall or ceiling — bleed velocity and fall
			player.velocity = Vector3.ZERO
			_emit_transition(State.States.FALLING)

func _spawn_impact(collision: KinematicCollision3D) -> void:
	if !impact_scene:
		return

	var instance := impact_scene.instantiate() as GPUParticles3D
	if !instance:
		return

	player.get_parent().add_child(instance)
	instance.global_position = collision.get_position()

	# Pick a reference axis that isn't parallel to the surface normal
	var normal := collision.get_normal()
	var reference := Vector3.FORWARD if abs(normal.dot(Vector3.UP)) > 0.9 else Vector3.UP
	var tangent := normal.cross(reference).normalized()
	var bitangent := normal.cross(tangent).normalized()
	instance.global_basis = Basis(tangent, normal, bitangent)
