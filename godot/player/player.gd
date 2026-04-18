class_name PlayerController extends CharacterBody3D

@export_category("References")
@export var camera_controller: CameraController
@export var state: State
#@export var mesh: MeshInstance3D
@export var model_root: Node3D

@export_category("Movement Settings")
@export var SPEED: float = 7.0
@export var SPRINT_SPEED: float = 15.0
@export var CROUCH_SPEED: float = 3.0
@export var ACCELERATION: float = 1.4
@export var JUMP_VELOCITY: float = 8.0
@export var SPRINT_JUMP_MULTI: float = 1.5
@export var AIR_CONTROL: float = 5.0 # higher is snappier, lower is more sluggish
@export var air_charge_max_distance: float = 100.0

func _ready() -> void:
	camera_controller.camera_rotation_changed.connect(_on_camera_rotation_changed)


# ---------------------------------------------------------
# ------------------------- Helper -------------------------
# ---------------------------------------------------------

func get_movement_direction() -> Vector3:
	var input_dir := Input.get_vector("move_left", "move_right", "move_forwards", "move_backwards")
	return Vector3(input_dir.x, 0, input_dir.y)\
		.rotated(Vector3.UP, camera_controller.camera_horizontal).normalized()

func get_input_dir() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_forwards", "move_backwards")

# player.gd
func do_raycast(direction: Vector3, distance: float, origin: Vector3 = global_position) -> Dictionary:
	var space = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(
		origin,
		origin + direction * distance
	)
	query.exclude = [self]  # don't hit yourself
	
	var result = space.intersect_ray(query)
	
	if result:
		return {
			"colliding": true,
			"point": result.position,
			"normal": result.normal,
			"collider": result.collider
		}
	return {
		"colliding": false,
		"point": Vector3.ZERO,
		"normal": Vector3.ZERO,
		"collider": null
	}

# ---------------------------------------------------------
# --------------------- Player Control ---------------------
# ---------------------------------------------------------

func air_control(calculated_speed: float, delta: float) -> void:
	var input_dir := get_input_dir()
	var input_strength := input_dir.length()  # 0.0 → 1.0
	if input_strength < 0.1:
		return
	
	var direction = get_movement_direction()
	
	var current_velocity := Vector2(velocity.x, velocity.z)
	# scaled by input
	var target_velocity := Vector2(direction.x, direction.z) * calculated_speed * input_strength  

	# Check if input is opposing current momentum
	var dot := current_velocity.dot(target_velocity.normalized()) 

	if dot < 0:
		# Input is backwards — only bleed off speed, don't propel backward
		current_velocity = current_velocity.move_toward(Vector2.ZERO, calculated_speed * AIR_CONTROL * delta)
	else:
		# Input is forward/sideways — normal air control
		current_velocity = lerp(current_velocity, target_velocity, AIR_CONTROL * delta)

	velocity.x = current_velocity.x
	velocity.z = current_velocity.y


# ---------------------------------------------------------
# ---------------------- Check States ----------------------
# ---------------------------------------------------------

func check_idle_state() -> void:
	if is_on_floor():
		if get_input_dir().length() > 0:
			state._emit_transition(State.States.MOVEMENT)
		else:
			state._emit_transition(State.States.IDLE)

func can_air_charge() -> bool:
	var cam_forward := -camera_controller.camera.global_transform.basis.z
	var cam_origin := camera_controller.camera.global_position
	var hit := do_raycast(cam_forward, air_charge_max_distance, cam_origin)
	return hit.colliding

# ---------------------------------------------------------
# ---------------------- Signals ----------------------
# ---------------------------------------------------------


func _on_camera_rotation_changed(horizontal: float, vertical: float):
	model_root.rotation.y = horizontal
	model_root.rotation.x = -vertical
