extends GPUParticles3D

func _ready():
	one_shot = true
	emitting = false
	await get_tree().process_frame
	print("=== PARTICLE DEBUG ===")
	print("global_position: ", global_position)
	print("emitting: ", emitting)
	print("visible: ", visible)
	print("amount: ", amount)
	print("lifetime: ", lifetime)
	print("process_material: ", process_material)
	print("draw_passes: ", draw_pass_1)
	print("visibility_aabb: ", visibility_aabb)
	print("one_shot: ", one_shot)
	emitting = true
	print("emitting after set: ", emitting)
	print("is_emitting: ", is_inside_tree())
	await get_tree().create_timer(lifetime + 0.1).timeout
	print("emitting after timer: ", emitting)
	print("is_emitting: ", is_inside_tree())
	queue_free()
	print("emitting after queue free: ", emitting)
	print("is_emitting: ", is_inside_tree())
