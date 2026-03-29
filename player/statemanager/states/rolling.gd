extends State

@export_category("References")
@export var player: PlayerController

func Enter():
	if !player:
		return


func Physics_Update(_delta):
	if !player:
		return
