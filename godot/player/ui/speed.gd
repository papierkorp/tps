extends Label

@export_category("References")
@export var player: PlayerController
	
func _process(_delta: float) -> void:
	var horizontal_speed = Vector2(player.velocity.x, player.velocity.z).length()
	var vertical_speed = abs(player.velocity.y)
	self.text = "horizontal speed: " + str(snappedf(horizontal_speed, 0.01)) + "\nvertical speed: " + str(snappedf(vertical_speed, 0.01))
