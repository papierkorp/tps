class_name State extends Node

signal state_transition(new_state_name: StringName)

enum States {
	IDLE,
	MOVEMENT,
	SPRINTING,
	JUMP,
	SPRINT_JUMP,
	FALLING,
	GLIDING,
	AIR_HOVER,
	AIR_DASH
}

const ALLOWED: Array[States] = []

func _emit_transition(new_state: States) -> void:
	if ALLOWED.is_empty() or new_state in ALLOWED:
		state_transition.emit(_state_to_string(new_state))
	else:
		push_error("Illegal transition from '%s' to '%s'" % [name, _state_to_string(new_state)])

func _state_to_string(state: States) -> StringName:
	return States.keys()[state].to_lower()

func Enter():
	pass

func Exit():
	pass

func Update(_delta):
	pass

func Physics_Update(_delta):
	pass
