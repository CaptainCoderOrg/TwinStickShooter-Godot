class_name PlayerMovementBehaviour
extends Node

@export var player_prefix : String = "player_1"
@export var movement_input : Vector2
@onready var body : Node2D = %Triceratops
@onready var player : Player = owner

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	movement_input = Input.get_vector(
		"%s_move_left" % player_prefix, 
		"%s_move_right" % player_prefix, 
		"%s_move_up" % player_prefix, 
		"%s_move_down" % player_prefix)
	player.velocity = movement_input * player.speed * ArenaManager.SPEED
	body.look_at(body.global_position + movement_input)
	player.move_and_slide()

