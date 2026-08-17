extends Label

func _process(_delta: float) -> void:
	self.text = "fps: " + str(Engine.get_frames_per_second())
