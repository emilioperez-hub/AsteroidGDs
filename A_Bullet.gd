@abstract class_name ABullet extends RigidBody2D

@export_subgroup("Bullet Base")
@export_range(0,5) var life_time : float = 1.5
@export_range(500,1000) var speed : float = 650
func _init() -> void:
	body_entered.connect(handle_asteroid_damage)
	pass
# Called when the node enters the scene tree for the first time.

@abstract func on_asteroid_collision(asteroid : A_Asteroid)
func handle_asteroid_damage(other : RigidBody2D) -> void:
	if !(other is A_Asteroid): return
	(other as A_Asteroid).take_dmg()
	on_asteroid_collision(other as A_Asteroid)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	
	life_time -= delta
	if life_time <= 0: queue_free() 
	pass

func dmg_asteroid(other : RigidBody2D) -> void:
	if !(other is A_Asteroid): return
	(other as A_Asteroid).take_dmg()
	queue_free()
	pass
		
