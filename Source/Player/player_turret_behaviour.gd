class_name PlayerTurretBehaviour
extends Node

@onready var player : Player = owner
@onready var turret : Node2D = %Turret
@export var direction : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	direction = Input.get_vector(
		"%s_turret_left" % player.prefix, 
		"%s_turret_right" % player.prefix, 
		"%s_turret_up" % player.prefix, 
		"%s_turret_down" % player.prefix)
	turret.look_at(turret.global_position + direction)
