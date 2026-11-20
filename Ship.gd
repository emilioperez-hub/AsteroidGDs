class_name Ship extends RigidBody2D

@export_range(1, 5) var hitPoints = 3

@export_range(200,800, 5) var speed : float = 600

@export_category("Shooting")
@export var bullet: PackedScene

@onready var sprite_visual: Sprite2D = $Sprite2D
@onready var pivot: Node2D = $Sprite2D

var initPos = Vector2.ZERO
var iFrames = 0
var scene : Node2D

func _ready() -> void:
	initPos = global_position
	scene = get_parent()
	pass 

func _physics_process(delta: float) -> void:
	if global_position.x >= 1152 - 28:
		global_position.x = 0 + 30
	if global_position.x <= 0 + 28:
		global_position.x = 1152 -30
	if global_position.y >= 648 - 28:
		global_position.y = 0 + 30
	if global_position.y <= 0 + 28:
		global_position.y = 648 - 30
	
	if iFrames > 0:
		contact_monitor = false
		iFrames -= 1
		pass
	
	
	if Input.is_action_just_pressed("Shoot"):
		_shoot()
	#var le da direccion para darle una direccion
	var direction: Vector2 = Input.get_vector("Left","Right","Up","Down").normalized() 
	linear_velocity = direction * speed
	pass

func _take_dmg() -> void:
	if iFrames > 0: return
	despawn()
	if hitPoints == 0:
		print_debug("Ship Destroyed")
		queue_free()
	
	pass
	
func despawn() -> void:
	get_parent().remove_child(self)
	pass

func respawn() -> void:
	hitPoints-=1
	teleport(initPos)
	linear_velocity = Vector2.ZERO
	iFrames = 10
	pass

func _shoot() -> void:
	var bulletobjt = (bullet.instantiate())
	get_parent().add_child(bulletobjt)
	bulletobjt.global_position = pivot.global_position
	bulletobjt.linear_velocity = Vector2.UP * 1000
	pass

func teleport(pos:Vector2) -> void:
	PhysicsServer2D.body_set_state(
		get_rid(),
		PhysicsServer2D.BODY_STATE_TRANSFORM,
		Transform2D.IDENTITY.translated(pos))
	pass
