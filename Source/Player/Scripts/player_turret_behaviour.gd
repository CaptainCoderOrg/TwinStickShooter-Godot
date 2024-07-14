class_name PlayerTurretBehaviour
extends Node

@onready var player : Player = owner
@onready var turret : Node2D = %Turret
@onready var fire_position : Node2D = %FirePosition
@export var direction : Vector2

func _process(delta):
	direction = Input.get_vector(
		"%s_turret_left" % player.prefix, 
		"%s_turret_right" % player.prefix, 
		"%s_turret_up" % player.prefix, 
		"%s_turret_down" % player.prefix)
	turret.look_at(turret.global_position + direction)
	if not direction.is_zero_approx():
		fire()

func fire():
	print("Fire")
	var projectile = player.weapon.instantiate() as Projectile
	projectile.global_position = fire_position.global_position
	projectile.rotation = turret.rotation
	get_tree().current_scene.add_child(projectile)
