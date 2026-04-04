class_name Bullet extends RigidBody3D

var speed: float = 50.0

func _ready():
	linear_velocity = -global_transform.basis.z * speed
	# auto-free after a few seconds
	get_tree().create_timer(5.0).timeout.connect(queue_free)

func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(10)
	queue_free()
