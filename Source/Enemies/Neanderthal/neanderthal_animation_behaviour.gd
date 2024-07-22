class_name NeanderthalAnimationBehaviour
extends Node

enum NeanderthalState { IDLE, MOVING, ATTACKING }

@onready var body : CharacterBody2D = owner
@onready var animation_tree: AnimationTree = %AnimationTree
@export var state : NeanderthalState = NeanderthalState.IDLE
var move_speed_parameter : String = "parameters/Move/TimeScale/scale"

@export var is_moving : bool: 
	get: return state == NeanderthalState.MOVING

var _animation_speed : float = 1

func _on_chase_player_behaviour_speed_change(speed : float) -> void:
	_animation_speed = speed
	if animation_tree:
		animation_tree.set(move_speed_parameter, _animation_speed)

func _on_animation_tree_ready() -> void:
	animation_tree.set(move_speed_parameter, _animation_speed)
