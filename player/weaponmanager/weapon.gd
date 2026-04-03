class_name Weapon extends Resource

@export_category("Default")
@export var weapon_name: String
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


var RAYCAST_DIST: float = 9999 # too far breaks it

var weapon_manager: WeaponManager


# --------------------------------------------------------
# ----------------------- shooting -----------------------
# --------------------------------------------------------

func can_shoot() -> bool:
	return ammo_current > 0 and not reload and is_equiped

func fire_shot():
	print("fire_shot()")
	weapon_manager.play_sound(sound_shoot)
	weapon_manager.play_anim(anim_shoot)
	weapon_manager.queue_anim(anim_idle)
	
	var raycast = weapon_manager.bullet_raycast
	raycast.target_position = Vector3(0,0,-abs(RAYCAST_DIST))
	raycast.force_raycast_update() # otherwise position is not updated

	if raycast.is_colliding():
		var obj = raycast.get_collider()
		var nrml = raycast.get_collision_normal()
		var pt = raycast.get_collision_point()

		if obj is RigidBody3D:
			obj.apply_impulse(-nrml * 55.0 / obj.mass, pt - obj.global_position)

		if obj.has_method("take_damage"):
			obj.take_damage(self.damage)


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
	print("on_trigger_down()")
	print("can_shoot: ", can_shoot())
	if can_shoot():
		if auto_fire:
			fire_shot()
			can_fire = false
			fire_delay_timer = 1.0 / shots_per_second
		else:
			fire_shot()

func process_auto_fire(delta: float):
	if auto_fire and trigger_down:
		if not can_fire:
			fire_delay_timer -= delta
			if fire_delay_timer <= 0.0:
				can_fire = true
		
		if can_fire:
			fire_shot()
			can_fire = false
			fire_delay_timer = 1.0 / shots_per_second

func on_trigger_up():
	fire_delay_timer = 0.0
	can_fire = true

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
	weapon_manager.play_anim("view_equip_anim")
	weapon_manager.queue_anim("view_idle_anim")

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
