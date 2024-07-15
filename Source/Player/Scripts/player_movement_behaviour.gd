class_name PlayerMovementBehaviour
extends Node
@export var movement_input : Vector2
@onready var body : Node2D = %Triceratops
@onready var player : Player = owner

func _physics_process(_delta : float) -> void:
	movement_input = Input.get_vector(
		"%s_move_left" % player.prefix, 
		"%s_move_right" % player.prefix, 
		"%s_move_up" % player.prefix, 
		"%s_move_down" % player.prefix)
	player.velocity = movement_input * player.speed * ArenaManager.SPEED
	body.look_at(body.global_position + movement_input)
	player.move_and_slide()

