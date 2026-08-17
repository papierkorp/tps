extends Label

@export_category("References")
@export var player_state_machine: PlayerStateMachine

func _process(_delta: float) -> void:
	if !player_state_machine:
		self.text = "State machine not assigned"
		return

	var output = ""

	if player_state_machine.current_state:
		output += "Current State: " + player_state_machine.current_state.name + "\n"

	output += "Available States:\n"
	for state_name in player_state_machine.states.keys():
		var marker = "  "
		if player_state_machine.current_state and state_name == player_state_machine.current_state.name.to_lower():
			marker = "► " # Show arrow for current state
		output += marker + state_name + "\n"

	self.text = output
