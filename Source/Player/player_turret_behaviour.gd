class_name PlayerTurretBehaviour
extends Node

@onready var player : Player = owner
@onready var turret : Node2D = %Turret
@export var direction : Vector2


func _process(delta):
	direction = Input.get_vector(
		"%s_turret_left" % player.prefix, 
		"%s_turret_right" % player.prefix, 
		"%s_turret_up" % player.prefix, 
		"%s_turret_down" % player.prefix)
	turret.look_at(turret.global_position + direction)
	if direction.is_zero_approx():
		fire()

func fire():
	pass
