class_name PiercingBulletPU extends APowerUp

@export var p_bullet_scene : PackedScene

func init()->void:
	pass

func activate()-> void:
	GameManager.continuous_actions.connect(replace_bullet_for_piercing)
	GameManager.delay_action(stop,5)
	pass

func replace_bullet_for_piercing()-> void:
	for child in GameManager.me.get_children():
		if !(child as ABullet) || child is PiercingBullet: continue
		var newPBullet = p_bullet_scene.instantiate()
		var other = child as ABullet
		GameManager.me.ad_child(newPBullet)
		newPBullet.shoot(other.linear_velocity)
		newPBullet.global.position = other.global_position
		other.queue_free()
	pass

func stop() ->void:
	GameManager.continuous_actions.disconnect(replace_bullet_for_piercing)
	queue_free()
	pass
