class_name PlayerController extends CharacterBody3D

@export_category("References")
@export var camera_controller: CameraController

@export_category("Movement Settings")
@export var SPEED: float = 7.0
@export var SPRINT_SPEED: float = 15.0
@export var ACCELERATION: float = 15.0
@export var JUMP_VELOCITY: float = 8.0
@export var SPRINT_JUMP_MULTI: float = 1.5

func Physics_Update(delta):
  # Apply reduced gravity for falling effect
	if not is_on_floor():
		velocity += get_gravity() * JUMP_VELOCITY * delta

func get_movement_direction() -> Vector3:
	var input_dir := Input.get_vector("move_left", "move_right", "move_forwards", "move_backwards")
	return Vector3(input_dir.x, 0, input_dir.y)\
		.rotated(Vector3.UP, camera_controller.camera_horizontal).normalized()

func get_input_dir() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_forwards", "move_backwards")
