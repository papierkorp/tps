class_name Bullet extends CharacterBody3D

var speed: float = 150.0
var damage: int = 10

func _ready():
	get_tree().create_timer(2.0).timeout.connect(queue_free)

func _physics_process(delta):
	velocity = -global_transform.basis.z * speed
	var collision = move_and_collide(velocity * delta)
	if collision:
		var body = collision.get_collider()
		if body.has_method("take_damage"):
			body.take_damage(damage)
		queue_free()
