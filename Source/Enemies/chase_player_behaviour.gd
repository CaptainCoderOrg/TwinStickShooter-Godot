class_name ChasePlayerBehaviour
extends Node

@export var min_speed : float = 1
@export var max_speed : float = 3
@export var speed : float
@onready var character_body : CharacterBody2D = owner
@onready var body : Node2D = %Body
@onready var move_target : Node2D = %MoveTarget
var target : Node2D

func _ready() -> void:
	speed = randf_range(min_speed, max_speed)

func acquire_target() -> void:
	if not target:
		target = get_tree().get_first_node_in_group("player")
		assert(target, "Player could not be found")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta : float) -> void:
	acquire_target()
	body.look_at(target.global_position)
	character_body.velocity = (move_target.global_position - character_body.global_position).normalized() * speed * ArenaManager.SPEED
	character_body.move_and_slide()	
