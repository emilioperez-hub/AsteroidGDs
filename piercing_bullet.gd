class_name PiercingBullet extends ABullet
@export var piercing : int = 3

func on_asteroid_collision(asteroid : A_Asteroid):
	piercing -= 1
	if piercing == 0: queue_free()
	pass
