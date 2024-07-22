class_name ChasePlayerBehaviour
extends Node

@export var min_speed : float = 1
@export var max_speed : float = 3
var _speed : float
@onready var character_body : CharacterBody2D = owner
@onready var body : Node2D = %Body
@onready var move_target : Node2D = %MoveTarget
var target : Node2D

@export var speed : float:
	get: return _speed
	set(value): 
		if _speed == value: return
		_speed = value
		speed_change.emit(_speed)

signal speed_change(speed: float)

func _ready() -> void:
	speed = randf_range(min_speed, max_speed)

func acquire_target() -> void:
	if not target:
		target = get_tree().get_first_node_in_group("player")
		assert(target, "Player could not be found")

func _physics_process(_delta : float) -> void:
	acquire_target()
	body.look_at(target.global_position)
	character_body.velocity = (move_target.global_position - character_body.global_position).normalized() * speed * ArenaManager.SPEED
	character_body.move_and_slide()	
