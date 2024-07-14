class_name Projectile
extends Node2D

@export var velocity : float = 10
@onready var target : Node2D = %TravelDirection

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var dir : Vector2 = target.global_position - self.global_position
	dir = dir.normalized() * velocity * ArenaManager.SPEED * delta
	self.global_position += dir
