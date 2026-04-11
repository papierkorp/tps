class_name WeaponManager extends Node3D

@export_category("References")
@export var player: CharacterBody3D
@export var camera_controller: CameraController
@export var camera: Camera3D
@export var impact_scene: PackedScene

@export_category("Weapon Settings")
@export var current_weapon: Weapon

var weapon_holder: Node3D

func _ready() -> void:
	_setup_weapon()
	_setup_animations()
	camera_controller.camera_rotation_changed.connect(_on_camera_rotation_changed)
	


# --------------------------------------------------------
# --------------------- input handler ---------------------
# --------------------------------------------------------

func _unhandled_input(event: InputEvent) -> void:
	if not current_weapon:
			return

	if event.is_action_pressed("shoot"):
		current_weapon.trigger_down = true
	elif event.is_action_released("shoot"):
		current_weapon.trigger_down = false
	if event.is_action_pressed("reload"):
		current_weapon.reload = true

func _process(delta):
	if not current_weapon:
			return
	
	if current_weapon.trigger_down and current_weapon.auto_fire:
		current_weapon.process_auto_fire(delta)

# --------------------------------------------------------
# ----------------------- shooting -----------------------
# --------------------------------------------------------
var current_weapon_instance: Node3D
var bullet_spawn: Marker3D

func _setup_weapon() -> void:
	weapon_holder = Node3D.new()
	add_child(weapon_holder)
	
	# Setup weapon resource
	current_weapon.weapon_manager = self
	
	# Instantiate the weapon model
	if current_weapon.weapon_scene:
		current_weapon_instance = current_weapon.weapon_scene.instantiate()
		bullet_spawn = current_weapon_instance.get_node_or_null("BulletSpawn")
		weapon_holder.add_child(current_weapon_instance)

		current_weapon_instance.position = current_weapon.weapon_position
		current_weapon_instance.rotation_degrees = current_weapon.weapon_rotation
		
	current_weapon.is_equiped = true

func fire_shot():
	play_sound(current_weapon.sound_shoot)
	play_anim(current_weapon.anim_shoot)
	queue_anim(current_weapon.anim_idle)
	current_weapon.ammo_currently_loaded -= 1
	do_raycast()
	if current_weapon.ammo_currently_loaded <= 0:
		current_weapon.reload=true

func do_raycast():
	var cam_forward := -camera.global_transform.basis.z
	var hit = player.do_raycast(cam_forward, current_weapon.RAYCAST_DIST, camera.global_position)
	
	if hit.colliding:
		if impact_scene:
			var impact = impact_scene.instantiate()
			get_tree().root.add_child(impact)
			var up = hit.normal
			var right = up.cross(Vector3.FORWARD)
			if right.length_squared() < 0.001:
				right = up.cross(Vector3.RIGHT)
			right = right.normalized()
			var forward = right.cross(up).normalized()
			impact.global_transform = Transform3D(Basis(right, up, forward), hit.point)
		var health_component = hit.collider.get_node_or_null("HealthComponent")
		if health_component and health_component.has_method("take_damage"):
			health_component.take_damage(current_weapon.damage, owner)
		
		if hit.collider is RigidBody3D:
			hit.collider.apply_impulse(-hit.normal * 55.0 / hit.collider.mass, hit.point - hit.collider.global_position)
		if hit.collider.has_method("take_damage"):
			hit.collider.take_damage(current_weapon.damage)
# --------------------------------------------------------
# ------------------------ sounds ------------------------
# --------------------------------------------------------

@onready var audio_stream_player = $AudioStreamPlayer3D

func play_sound(sound: AudioStream):
	if sound:
		if audio_stream_player.stream != sound:
			audio_stream_player.stream = sound
		audio_stream_player.play()

func stop_sounds():
	audio_stream_player.stop()

# --------------------------------------------------------
# ---------------------- animations ----------------------
# --------------------------------------------------------

var anim_player: AnimationPlayer
var last_played_anim: String = ""
var current_anim_finished_callback
var current_anim_cancelled_callback

func _setup_animations() -> void:
	var weapon_anim_player = current_weapon_instance.get_node_or_null("AnimationPlayer")
	if weapon_anim_player:
		anim_player = weapon_anim_player
		anim_player.animation_changed.connect(current_anim_changed)

func play_anim(anim_name: String, finished_callback = null, cancelled_callback = null):
	if last_played_anim and get_anim() == last_played_anim and current_anim_cancelled_callback is Callable:
		current_anim_cancelled_callback.call()

	if not anim_player or not anim_player.has_animation(anim_name):
		if finished_callback is Callable:
			finished_callback.call()
		return

	current_anim_finished_callback = finished_callback
	current_anim_cancelled_callback = cancelled_callback
	last_played_anim = anim_name  # ← set BEFORE play()

	anim_player.clear_queue()
	anim_player.seek(0.0)
	anim_player.play(anim_name)

func current_anim_changed(_old_anim: StringName, new_anim: StringName):
	if new_anim != last_played_anim and current_anim_finished_callback is Callable:
		current_anim_finished_callback.call()
	last_played_anim = new_anim
	current_anim_finished_callback = null
	current_anim_cancelled_callback = null

func get_anim() -> String:
	if not anim_player: return ""
	return anim_player.current_animation

func queue_anim(anim: String):
	if not anim_player: return
	anim_player.queue(anim)

func _on_camera_rotation_changed(horizontal: float, vertical: float):
	weapon_holder.rotation.y = horizontal
	weapon_holder.rotation.x = -vertical
