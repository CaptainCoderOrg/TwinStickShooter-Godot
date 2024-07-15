class_name PlayerTurretBehaviour
extends Node

@onready var player : Player = owner
@onready var turret : Node2D = %Turret
@onready var fire_position : Node2D = %FirePosition
@export var direction : Vector2

var is_cooling_down : bool = false

func _process(_delta : float) -> void:
	direction = Input.get_vector(
		"%s_turret_left" % player.prefix, 
		"%s_turret_right" % player.prefix, 
		"%s_turret_up" % player.prefix, 
		"%s_turret_down" % player.prefix)
	turret.look_at(turret.global_position + direction)
	if not direction.is_zero_approx():
		fire()

func fire() -> void:
	if is_cooling_down: return
	
	var projectile : Projectile = player.weapon.instantiate() as Projectile
	projectile.global_position = fire_position.global_position
	projectile.rotation = turret.rotation
	get_tree().get_first_node_in_group("bullet_manager").add_child(projectile)
	is_cooling_down = true
	var timer : SceneTreeTimer = get_tree().create_timer(player.weapon_cooldown)
	await timer.timeout
	is_cooling_down = false
