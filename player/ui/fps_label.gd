extends Label

func _process(delta: float) -> void:
	self.text = "fps: " + str(Engine.get_frames_per_second())
