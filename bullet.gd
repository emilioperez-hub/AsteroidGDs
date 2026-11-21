class_name Bullet extends ABullet
	
func on_asteroid_collision(asteroid : A_Asteroid) -> void:
	queue_free()
	pass
