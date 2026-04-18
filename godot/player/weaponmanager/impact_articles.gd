extends GPUParticles3D

@export var decal: Decal
var stay_time := 5.0
var fade_time := 1.0

func _ready():
	# impact
	one_shot = true
	emitting = true
	await get_tree().create_timer(lifetime + 0.1).timeout
	# decals
	await get_tree().create_timer(stay_time).timeout
	var tween = create_tween()
	tween.tween_property(decal, "modulate:a", 0.0, fade_time)
	await tween.finished
	queue_free()
