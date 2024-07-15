class_name ChasePlayerBehaviour
extends Node

@onready var character_body : CharacterBody2D = owner
@onready var body : Node2D = %Body
var target : Node2D

func acquire_target() -> void:
	if not target:
		target = get_tree().get_first_node_in_group("player")
		assert(target, "Player could not be found")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta : float) -> void:
	acquire_target()
	body.look_at(target.global_position)
