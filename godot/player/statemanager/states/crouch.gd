extends State

@export_category("References")
@export var player: PlayerController
@export var mesh: MeshInstance3D
@export var stand_collision: CollisionShape3D
@export var crouch_collision: CollisionShape3D
@export var weapon_manager: WeaponManager
@export var animation_player: AnimationPlayer


const ALLOWED: Array[State.States] = [State.States.IDLE, State.States.MOVEMENT,State.States.JUMP, State.States.AIR_RISE]

const CROUCH_SCALE := 0.5

func Enter():
	if !player:
		return
	stand_collision.disabled = true
	crouch_collision.disabled = false
	mesh.scale.y = CROUCH_SCALE
	mesh.position.y = -CROUCH_SCALE/2
	animation_player.play("crouch")
	
	var current_weapon_y = weapon_manager.current_weapon_instance.position.y
	var current_weapon_x = weapon_manager.current_weapon_instance.position.x
	var current_weapon_z = weapon_manager.current_weapon_instance.position.z
	
	weapon_manager.current_weapon_instance.position=Vector3(current_weapon_x, current_weapon_y - 0.5, current_weapon_z)

func Physics_Update(_delta):
	if !player:
		return

	if not Input.is_action_pressed("crouch"):
		_emit_transition(State.States.MOVEMENT)

	if Input.is_action_just_pressed("aircharge"):
		_emit_transition(State.States.AIR_RISE)

	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		_emit_transition(State.States.JUMP)

	var direction := player.get_movement_direction()
		
	if player.get_input_dir().length() < 0.1 and not Input.is_action_pressed("crouch"):
		_emit_transition(State.States.IDLE)

	if direction:
		player.velocity.x = direction.x * player.CROUCH_SPEED
		player.velocity.z = direction.z * player.CROUCH_SPEED
		
		player.move_and_slide()

func Exit():
	stand_collision.disabled = false
	crouch_collision.disabled = true
	mesh.scale.y = CROUCH_SCALE*2
	mesh.position.y = 0.0
	animation_player.play_backwards("crouch")
	var current_weapon_y = weapon_manager.current_weapon_instance.position.y
	var current_weapon_x = weapon_manager.current_weapon_instance.position.x
	var current_weapon_z = weapon_manager.current_weapon_instance.position.z
	
	weapon_manager.current_weapon_instance.position=Vector3(current_weapon_x, current_weapon_y + 0.5, current_weapon_z)
