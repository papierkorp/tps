extends Label

@export_category("References")
@export var weapon_manager: WeaponManager
	
func _process(_delta: float) -> void:
	var current_ammo = weapon_manager.current_weapon.ammo_currently_loaded
	var reserve_ammo = weapon_manager.current_weapon.ammo_reserve
	self.text = str(current_ammo) + "/" + str(reserve_ammo)
