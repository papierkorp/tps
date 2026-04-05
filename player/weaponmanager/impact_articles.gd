extends GPUParticles3D

func _ready():
	emitting = true
	# lifetime * 2 gives all particles time to die
	get_tree().create_timer(lifetime * 2).timeout.connect(queue_free)
