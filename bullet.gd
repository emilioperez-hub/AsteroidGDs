class_name Bullet extends ABullet

func _physics_process(delta: float) -> void:
	pass
	
func on_asteroid_collision(asteroid : A_Asteroid) -> void:
	queue_free()
	pass
