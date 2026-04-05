class_name CameraController extends Node3D

@export_category("References")
@export var player: PlayerController
@export var camera: Camera3D
@export var shape_cast: ShapeCast3D
@export var animation_player: AnimationPlayer

@export_category("Mouse Settings")
@export var mouse_sensitivity: float = 0.003

@export_category("Camera Settings")
@export var min_pitch: float = -60.0
@export var max_pitch: float = 60.0

var camera_horizontal: float = 0.0
var camera_vertical: float = 0.0
var camera_offset: Vector3
signal horizontal_rotation_changed(angle: float)

# ---------------------------------------------------------
# ------------------------ Runtime ------------------------
# ---------------------------------------------------------

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		_toggle_mouse()
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		_set_mouse_movement(event)
	if event.is_action_pressed("scope_in"):
		animation_player.play("zoom_in")
	if event.is_action_released("scope_in"):
		animation_player.play_backwards("zoom_in")

func _process(delta: float) -> void:
	_update_camera(delta)

# ---------------------------------------------------------
# ----------------------- Initialize -----------------------
# ---------------------------------------------------------

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	shape_cast.add_exception(player)
	init_vars()

func init_vars() -> void:
	shape_cast.target_position = camera.position
	camera_offset = camera.position

# ---------------------------------------------------------
# --------------------- Mouse Settings ---------------------
# ---------------------------------------------------------

func _set_mouse_movement(event: InputEvent) -> void:
	camera_horizontal -= event.relative.x * mouse_sensitivity
	camera_vertical = clamp(
		camera_vertical + event.relative.y * mouse_sensitivity,
		deg_to_rad(min_pitch),
		deg_to_rad(max_pitch)
	)
	

func _update_camera(delta: float) -> void:
	var rotated_offset := camera_offset.rotated(Vector3.UP, camera_horizontal)

	# Point the ShapeCast toward the desired camera position and set its length
	shape_cast.target_position = rotated_offset
	# (ShapeCast3D origin is at Node3D position, i.e. the camera pivot)

	if shape_cast.is_colliding():
		var margin := 0.2
		var safe_fraction := shape_cast.get_closest_collision_safe_fraction()
		var safe_dist := rotated_offset.length() * safe_fraction - margin
		var target = rotated_offset.normalized() * max(safe_dist, 0.1)
		camera.position = camera.position.lerp(target, 20.0 * delta)
	else:
		camera.position = rotated_offset

	camera.rotation.y = camera_horizontal
	camera.rotation.x = -camera_vertical
	# player.rotation.y = camera_horizontal
	horizontal_rotation_changed.emit(camera_horizontal)

func _toggle_mouse() -> void:
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
