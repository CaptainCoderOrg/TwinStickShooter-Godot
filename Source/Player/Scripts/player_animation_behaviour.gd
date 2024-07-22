extends Node

@onready var player : Player = owner
@export var is_moving : bool:
	get:
		if player: 
			return not player.velocity.is_zero_approx()
		return false
