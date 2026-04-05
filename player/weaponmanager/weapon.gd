class_name Weapon extends Resource

@export_category("Default")
@export var weapon_name: String
@export var weapon_scene: PackedScene
@export var weapon_position: Vector3 = Vector3.ZERO
@export var weapon_rotation: Vector3 = Vector3.ZERO
@export var damage = 10

@export_category("Animation")
@export var anim_idle: String
@export var anim_equip: String
@export var anim_shoot: String
@export var anim_reload: String
@export var anim_outofammo: String

@export_category("Sound")
@export var sound_shoot: AudioStream
@export var sound_reload: AudioStream
@export var sound_unholster: AudioStream

@export_category("Ammo")
@export var ammo_current: int
@export var ammo_reserve: int
@export var ammo_magazine: int
@export var ammo_max: int

@export_category("Auto Fire")
@export var auto_fire: bool
@export var shots_per_second: float = 10.0

@export_category("Projectile")
@export var bullet_scene: PackedScene
@export var bullet_speed: float = 50.0

var RAYCAST_DIST: float = 999.0 # is used for do_raycast()

var weapon_manager: WeaponManager


# --------------------------------------------------------
# ----------------------- shooting -----------------------
# --------------------------------------------------------

func can_shoot() -> bool:
	return ammo_current > 0 and not reload and is_equiped

var fire_delay_timer: float = 0.0
var can_fire: bool = true

var trigger_down := false :
	set(v):
		if trigger_down != v:
			trigger_down = v
			if trigger_down:
				on_trigger_down()
			else:
				on_trigger_up()

func on_trigger_down():
	if can_shoot():
		if auto_fire:
			weapon_manager.fire_shot()
			can_fire = false
			fire_delay_timer = 1.0 / shots_per_second
		else:
			weapon_manager.fire_shot()
			

func on_trigger_up():
	fire_delay_timer = 0.0
	can_fire = true

func process_auto_fire(delta: float):
	if auto_fire and trigger_down:
		if not can_fire:
			fire_delay_timer -= delta
			if fire_delay_timer <= 0.0:
				can_fire = true
		if can_fire:
			weapon_manager.fire_shot()
			can_fire = false
			fire_delay_timer = 1.0 / shots_per_second

# --------------------------------------------------------
# ----------------------- inventory -----------------------
# --------------------------------------------------------

var is_equiped := false :
	set(v):
		if is_equiped != v:
			is_equiped = v
			if is_equiped:
				on_equip()
			else:
				on_unequip()

func on_equip():
	weapon_manager.play_anim(anim_equip)
	weapon_manager.queue_anim(anim_idle)

func on_unequip():
	pass

# --------------------------------------------------------
# ------------------------ reload ------------------------
# --------------------------------------------------------

var reload := false :
	set(v):
		if reload != v:
			reload = v
			if reload:
				on_reload()
			else:
				on_reload_finished()

func on_reload():
	print("on_reload()")
	reload_ammo()

func on_reload_finished():
	pass

func reload_ammo():
	print("reload")
	weapon_manager.play_sound(sound_reload)
	weapon_manager.play_anim(anim_reload)
	weapon_manager.queue_anim(anim_idle)
	reload = false
