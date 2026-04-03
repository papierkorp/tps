class_name WeaponManager extends Node3D

@export_category("References")
@export var player: CharacterBody3D
@export var anim_player: AnimationPlayer
@export var bullet_raycast: RayCast3D

@export_category("Weapon Settings")
@export var current_weapon: Weapon

@onready var audio_stream_player = $AudioStreamPlayer3D

func _ready() -> void:
	current_weapon.weapon_manager = self
	current_weapon.is_equiped = true

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
# ------------------------ sounds ------------------------
# --------------------------------------------------------

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

var last_played_anim: String = ""
var current_anim_finished_callback
var current_anim_cancelled_callback

func play_anim(anim_name: String, finished_callback = null, cancelled_callback = null):
	if last_played_anim and get_anim() == last_played_anim and current_anim_cancelled_callback is Callable:
		current_anim_cancelled_callback.call() # last anim didnt finish yet

	if not anim_player or not anim_player.has_animation(anim_name):
		if finished_callback is Callable:
			finished_callback.call() # treat empty anim as finishing immediately
		return

	current_anim_finished_callback = finished_callback
	current_anim_cancelled_callback = cancelled_callback

	anim_player.clear_queue()
	anim_player.seek(0.0)
	anim_player.play(anim_name)

func current_anim_changed(new_anim: StringName):
	if new_anim != last_played_anim and current_anim_finished_callback is Callable:
		current_anim_finished_callback.call()
	last_played_anim = anim_player.current_animation
	if last_played_anim != anim_player.current_animation:
		current_anim_finished_callback = null
		current_anim_cancelled_callback = null

func get_anim() -> String:
	if not anim_player: return ""
	return anim_player.current_animation

func queue_anim(anim: String):
	if not anim_player: return
	anim_player.queue(anim)
